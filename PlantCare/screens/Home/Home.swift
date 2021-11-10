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
        let name = selectName(store.state)
        let email = selectEmail(store.state)
        VStack {
            Text("Hello, \(name)")
            Text("Your email is: \(email)")
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
