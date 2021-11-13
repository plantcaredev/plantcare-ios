//
//  Plants.selectors.swift
//  PlantCare
//
//  Created by Eric Alas on 2021-11-10.
//

import Foundation

let selectPlantState = createSelector(selector1: {(state: AppState) in return state}, {state in return state.plants})

struct PlantUI: Identifiable, Hashable {
    let id: UUID
    var name: String
    var location: String
    var image: String
    var hasImage: Bool
}
let selectPlants = createSelector(selector1: selectPlantState, {plantState -> [PlantUI] in
    return plantState.plants.map { plant in
        return PlantUI(id: plant.id, name: plant.name, location: plant.location, image: plant.image, hasImage: plant.image.count > 0)
    }
    
})
