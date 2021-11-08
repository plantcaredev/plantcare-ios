//
//  Home.swift
//  PlantCare
//
//  Created by Eric Alas on 2021-11-08.
//

import SwiftUI

struct Home: View {
    @ObservedObject private var store = ObservableStore(store: plantCareStore)

    var body: some View {
        VStack {
            Text("Hello, \(store.state.plantCare.name)")
            Text("Your email is: \(store.state.plantCare.email)")
            Button(action: store.dispatch(PlantCareThunkLogout)) {
                Text("Logout")
            }
        }
        .frame(maxWidth: .infinity)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
