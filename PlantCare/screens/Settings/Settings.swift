//
//  Settings.swift
//  PlantCare
//
//  Created by Eric Alas on 2021-11-08.
//

import SwiftUI

struct Settings: View {
    @ObservedObject private var store = ObservableStore(store: plantCareStore)

    var body: some View {
        VStack {
            Text("Settings")
            Button {
                store.dispatch(PlantCareThunkLogout)
            } label: {
                Text("Logout")
            }
        }
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
