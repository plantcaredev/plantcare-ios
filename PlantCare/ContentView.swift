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
        VStack {
            if store.state.plantCare.loggedInStatus == .unknown {
                LoadingScreen()
            }
            if store.state.plantCare.loggedInStatus == .loggedOut {
                LoginScreen()
            }

            if store.state.plantCare.loggedInStatus == .loggedIn && store.state.plantCare.needsOnBoarding {
                InitialOnBoarding(fullName: store.state.plantCare.name, email: store.state.plantCare.email)
            }

            if store.state.plantCare.loggedInStatus == .loggedIn && !store.state.plantCare.needsOnBoarding {
                Text("Hello, \(store.state.plantCare.name)")
                Text("Your email is: \(store.state.plantCare.email)")
                Button(action: store.dispatch(PlantCareThunkLogout)) {
                    Text("Logout")
                }
            }
        }
    }

}
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
