//
//  Plants.state.swift
//  PlantCare
//
//  Created by Eric Alas on 2021-11-10.
//

import Foundation

struct Plant: Identifiable, Hashable {
    let id: UUID = UUID()
    var name: String
    var location: String
    var image: String
}

let mock_plants: [Plant] = [
    Plant(name: "Plant 1", location: "Eric's Bedroom", image: "https://houseplanthouse.files.wordpress.com/2021/04/monstera_deliciosa_growth_houseplanthouse_blogpost_2016_to_2021-32.jpg"),
    Plant(name: "Plant 2", location: "Living Room", image: "https://imagesvc.meredithcorp.io/v3/mm/image?q=85&c=sc&poi=face&w=1444&h=722&url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F37%2F2019%2F04%2F12161404%2FAdobeStock_259294596.jpg"),
    Plant(name: "Plant 3", location: "Dining Room", image: ""),
    Plant(name: "Plant 4", location: "Dining Room", image: ""),
    Plant(name: "Plant 5", location: "Dining Room", image: ""),
    Plant(name: "Plant 6", location: "Dining Room", image: ""),
    Plant(name: "Plant 7", location: "Dining Room", image: ""),
    Plant(name: "Plant 8", location: "Dining Room", image: "")
]

struct PlantsState: Hashable {
    var plants: [Plant] = mock_plants
    var fetchingPlants: Bool = false
}
