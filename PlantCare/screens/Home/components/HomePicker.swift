//
//  HomePicker.swift
//  PlantCare
//
//  Created by Eric Alas on 2021-11-17.
//

import SwiftUI

struct HomePicker: View {
    @ObservedObject private var store = ObservableStore(store: plantCareStore)

    var body: some View {
        let selectedHome = selectCurrentHome(store.state)
        let homes = selectHomes(store.state)

        Text("Welcome back to,")
            .font(.custom("Mulish-ExtraBold", size: 28))
        Menu {
            ForEach(homes, id: \.self) { home in
                Button("\(home.name)") {
                    store.dispatch(HomesActionSetSelectedHome(selectedHome: home.identifier))
                }
            }
        } label: {
            HStack(alignment: .center) {
                Text("\(selectedHome?.name ?? "")")
                    .foregroundColor(.black)
                    .font(.custom("Mulish-ExtraBold", size: 25))
                Image(systemName: "chevron.down")
                    .foregroundColor(.black)
                Spacer()
            }
            .frame(maxWidth: .infinity)
        }
    }
}

struct HomePicker_Previews: PreviewProvider {
    static var previews: some View {
        HomePicker()
    }
}
