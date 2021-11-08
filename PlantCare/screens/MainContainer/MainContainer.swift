//
//  MainContainer.swift
//  PlantCare
//
//  Created by Eric Alas on 2021-11-08.
//

import SwiftUI

struct MainContainer: View {
    @ObservedObject private var store = ObservableStore(store: plantCareStore)

    var body: some View {
        let selectedView = store.state.plantCare.selectedView
        VStack {
            ScrollView {
                if selectedView == .home {
                    Home()
                }
                if selectedView == .plants {
                    MyPlants()
                }
                if selectedView == .settings {
                    Settings()
                }
            }
            Spacer()
            BottomNavigationBar()
        }
            .edgesIgnoringSafeArea([.bottom])
    }
}

struct MainContainer_Previews: PreviewProvider {
    static var previews: some View {
        MainContainer()
    }
}
