//
//  PlantListingActionBar.swift
//  PlantCare
//
//  Created by Eric Alas on 2021-11-09.
//

import SwiftUI

struct PlantListingActionBar: View {
    @Binding var searchTerm: String
    @Binding var filterItemSelection: String
    var availableFilterItems: [String]

    var body: some View {
        HStack {
            SearchField(text: $searchTerm)
            Menu {
                Button {
                    filterItemSelection = "All"
                } label: {
                    HStack {
                        if filterItemSelection == "All" {
                            Image(systemName: "checkmark.circle")
                        }
                        Text("All")
                    }
                }
                ForEach(availableFilterItems, id: \.self) { location in
                    Button {
                        filterItemSelection = location
                    } label: {
                        HStack {
                            if filterItemSelection == location {
                                Image(systemName: "checkmark.circle")
                            }
                            Text(location)
                        }
                    }

                }
            } label: {
                Image(systemName: "slider.horizontal.3")
                    .foregroundColor(filterItemSelection != "All" ? Color.blue : Color.gray)
                    .frame(width: 45, height: 36)
            }
        }
            .padding([.trailing, .leading])
    }
}

struct PlantListingActionBar_Previews: PreviewProvider {
    static var previews: some View {
        PlantListingActionBar(searchTerm: .constant(""), filterItemSelection: .constant(""), availableFilterItems: ["Room1", "Room2"])
    }
}
