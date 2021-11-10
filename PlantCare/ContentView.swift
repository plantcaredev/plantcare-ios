//
//  ContentView.swift
//  PlantCare
//
//  Created by Eric Alas on 2021-11-01.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var store = ObservableStore(store: plantCareStore)

    var body: some View {
        let loggedInStatus = selectLoggedInStatus(store.state)
        let shouldShowOnBoarding = selectShouldShowOnBoarding(store.state)
        let shouldOpenMainScreen = selectShouldOpenMainScreen(store.state)

        VStack {
            if loggedInStatus == .unknown {
                LoadingScreen()
            }
            if loggedInStatus == .loggedOut {
                LoginScreen()
            }

            if shouldShowOnBoarding {
                InitialOnBoarding(fullName: store.state.plantCare.name, email: store.state.plantCare.email)
            }

            if shouldOpenMainScreen {
                MainContainer()
            }
        }
    }

}
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
