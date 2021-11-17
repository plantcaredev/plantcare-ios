//
//  PlantDetails2.swift
//  PlantCare
//
//  Created by Eric Alas on 2021-11-14.
//

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
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>

    var plant: PlantUI
    @State private var showImageViewer = false
    @State private var showHeader = false
    @GestureState private var dragOffset = CGSize.zero

    var body: some View {
        VStack {
            GeometryReader { geo in
                ZStack(alignment: .top) {
                    ScrollView {
                        VStack {
                            VStack {
                                PlantDetailsImage(plant: plant, frameHeight: geo.size.height, frameWidth: geo.size.width, topOffset: getSafeAreaTop(), showImageViewer: $showImageViewer)
                            }
                            PlantDetailsContent()
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
        .gesture(DragGesture().updating($dragOffset, body: { value, _, _ in
            if value.startLocation.x < 20, value.translation.width > 100 {
                self.dismissSelf()
            }
        }))
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
        PlantDetails(plant: PlantUI(plant: mock_plants[2]))
    }
}
