//
//  MyPlants.swift
//  PlantCare
//
//  Created by Eric Alas on 2021-11-08.
//

import SwiftUI

struct MyPlants: View {
    @ObservedObject private var store = ObservableStore(store: plantCareStore)

    @State var searchTerm: String = ""

    var body: some View {
        NavigationView {
            VStack {
                Text("My Plants")
                    .foregroundColor(.black)
                    .font(.custom("Mulish-ExtraBold", size: 30))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                HStack {
                    SearchField(text: $searchTerm)
                }
                .padding([.trailing, .leading])
                PlantList(searchingFor: searchTerm)
            }
            .navigationBarHidden(true)
        }
    }
}

struct MyPlants_Previews: PreviewProvider {
    static var previews: some View {
        MyPlants()
    }
}
