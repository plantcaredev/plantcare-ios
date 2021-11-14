//
//  PlantDetails2.swift
//  PlantCare
//
//  Created by Eric Alas on 2021-11-12.
//

import ImageViewerRemote
import SwiftUI

struct PlantDetails: View {
    @ObservedObject private var store = ObservableStore(store: plantCareStore)
    var plant: PlantUI
    
    @State private var topOffset: CGFloat = 0
    @State private var showImageViewer = false
    @State private var showHeader = false
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    struct OffsetPreferenceKey: PreferenceKey {
        static var defaultValue: CGFloat = .zero
        static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {}
    }
    
    var body: some View {
        VStack {
            GeometryReader { geo in
                ZStack(alignment: .top) {
                    ScrollView {
                        VStack {
                            PlantDetailsImage(plant: plant, frameHeight: geo.size.height + -topOffset, frameWidth: geo.size.width, showImageViewer: $showImageViewer)
                                .offset(y: topOffset)
                                .background(
                                    GeometryReader { proxy in
                                        Color.clear
                                            .preference(
                                                key: OffsetPreferenceKey.self,
                                                value: min(0, -proxy.frame(in: .named("ScrollView")).minY)
                                            )
                                    })
                            
                            LazyVStack(spacing: 20) {
                                ForEach(0 ..< 10) { _ in
                                    Rectangle()
                                        .fill(Color.gray.opacity(0.5))
                                        .frame(height: 100)
                                }
                            }
                            .background(
                                GeometryReader { vstackGeo -> Color in
                                    let y = vstackGeo.frame(in: .global).minY
                                    DispatchQueue.main.async {
                                        if y <= 100 {
                                            withAnimation {
                                                showHeader = true
                                            }
                                        } else {
                                            withAnimation {
                                                showHeader = false
                                            }
                                        }
                                    }
                                    return Color.clear
                                }
                            )
                        }
                    }
                    .coordinateSpace(name: "ScrollView")
                    .onPreferenceChange(OffsetPreferenceKey.self) { value in
                        topOffset = value
                    }
                    
                    if !showHeader && !showImageViewer {
                        DetailsViewDismissButton(yOffset: getSafeAreaTop()) {
                            self.mode.wrappedValue.dismiss()
                        }
                        .padding([.top])
                    }
                    
                    if showHeader {
                        PlantDetailsHeader(plant: plant, frameHeight: geo.size.height, frameWidth: geo.size.width, safeAreaTop: getSafeAreaTop(), dismiss: dismissSelf)
                    }
                }
                .ignoresSafeArea(edges: [.top])
                .navigationBarTitle("")
                .navigationBarHidden(true)
            }
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .overlay(ImageViewerRemote(imageURL: .constant(plant.image), viewerShown: self.$showImageViewer))
        .onChange(of: showImageViewer) { newValue in
            store.dispatch(PlantCareActionUpdateHideNavigation(hideNavigation: newValue))
        }
    }
    
    func dismissSelf() {
        self.mode.wrappedValue.dismiss()
    }
    
    func getSafeAreaTop() -> CGFloat {
        let keyWindow = UIApplication.shared.connectedScenes
            .filter { $0.activationState == .foregroundActive }
            .map { $0 as? UIWindowScene }
            .compactMap { $0 }
            .first?.windows
            .filter { $0.isKeyWindow }.first
        
        return keyWindow?.safeAreaInsets.top ?? 10
    }
}

struct PlantDetails_Previews: PreviewProvider {
    static var previews: some View {
        PlantDetails(plant: PlantUI(plant: mock_plants[0]))
    }
}
