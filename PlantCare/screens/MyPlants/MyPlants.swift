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
    @State private var filterRoomSelection: String = "All"

    var body: some View {
        let plants = store.state.plants.plants
        let plantsFiltered = searchTerm.count > 0 ? plants.filter { $0.name.contains(searchTerm) }: plants
        let plantsToShow = filterRoomSelection != "All" ? plantsFiltered.filter { $0.location == filterRoomSelection }: plantsFiltered
        let roomsForFiltering = plants.map { $0.location }.uniqued()

        NavigationView() {
            VStack {
                Text("My Plants")
                    .foregroundColor(Color("DarkPurple"))
                    .font(.custom("Mulish-ExtraBold", size: 30))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                PlantListingActionBar(searchTerm: $searchTerm, filterItemSelection: $filterRoomSelection, availableFilterItems: roomsForFiltering)
                PlantList(plants: plantsToShow)
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
