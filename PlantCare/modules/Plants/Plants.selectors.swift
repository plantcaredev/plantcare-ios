//
//  Plants.selectors.swift
//  PlantCare
//
//  Created by Eric Alas on 2021-11-10.
//

import Foundation
import OrderedCollections

let selectPlantState = createSelector(selector1: { (state: AppState) in state }, { state in state.plants })

struct PlantUI: Identifiable, Hashable {
    let id: UUID
    var name: String
    var location: String
    var image: String
    var hasImage: Bool

    init(plant: Plant) {
        self.id = plant.id
        self.name = plant.name
        self.location = plant.location
        self.image = plant.image
        self.hasImage = plant.image.count > 0
    }
}

let selectPlants = createSelector(selector1: selectPlantState) { plantState -> [PlantUI] in
    plantState.plants.map { plant in
        PlantUI(plant: plant)
    }
}

typealias RoomToPlants = OrderedDictionary<String, [PlantUI]>
let selectRoomToPlants = createSelector(selector1: selectPlants) { plants -> RoomToPlants in
    var roomToPlants: RoomToPlants = [:]
    let sortedPlant = plants.sorted { $0.name < $1.name }
    for plant in sortedPlant {
        if roomToPlants[plant.location] == nil {
            roomToPlants[plant.location] = [] as [PlantUI]
        }
        roomToPlants[plant.location]?.append(plant)
    }
    return roomToPlants
}
