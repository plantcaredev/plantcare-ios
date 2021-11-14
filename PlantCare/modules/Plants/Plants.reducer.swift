//
//  File.swift
//  PlantCare
//
//  Created by Eric Alas on 2021-11-10.
//

import Foundation
import ReSwift

func plantsReducer(action: Action, state: PlantsState?) -> PlantsState {
    var state = state ?? PlantsState()
    
    switch action {
    case let action as PlantActionSetFetchingPlants:
        state.fetchingPlants = action.isFetching
        break
        
    default:
        break
    }
    
    return state
}
