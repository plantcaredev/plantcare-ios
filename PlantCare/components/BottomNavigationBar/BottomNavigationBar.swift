//
//  BottomNavigationBar.swift
//  PlantCare
//
//  Created by Eric Alas on 2021-11-08.
//

import SwiftUI

struct BottomNavigationBar: View {
    @ObservedObject private var store = ObservableStore(store: plantCareStore)

    var body: some View {
        let selectedView = selectSelectedView(store.state)
        VStack(alignment: .center) {
            HStack {
                Spacer()
                Button {
                    store.dispatch(PlantCareActionSetSelectedView(selectedView: .home))
                } label: {
                    BottomBarSection(icon: "house", text: "Home", isSelected: selectedView == .home)
                }
                Spacer()
                Spacer()
                Button {
                    store.dispatch(PlantCareActionSetSelectedView(selectedView: .plants))
                } label: {
                    BottomBarSection(icon: "leaf", text: "My plants", isSelected: selectedView == .plants)
                }

                Spacer()
                Spacer()
                Button {
                    store.dispatch(PlantCareActionSetSelectedView(selectedView: .settings))
                } label: {
                    BottomBarSection(icon: "gearshape", text: "Settings", isSelected: selectedView == .settings)
                }
                Spacer()
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.white
            .cornerRadius(30, corners: [.topLeft, .topRight])
            .shadow(color: .gray.opacity(0.5), radius: 1, x: 0, y: -1)
        )
    }
}

struct BottomNavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        BottomNavigationBar()
    }
}
