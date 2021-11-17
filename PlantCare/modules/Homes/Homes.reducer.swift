//
//  Homes.reducer.swift
//  PlantCare
//
//  Created by Eric Alas on 2021-11-16.
//

import Foundation
import ReSwift

func homesReducer(action: Action, state: HomesState?) -> HomesState {
    var state = state ?? HomesState()

    switch action {
    case let action as HomesActionSetSelectedHome:
        state.selectedHome = action.selectedHome
    case let action as HomesActionSetHomes:
        state.homes = action.homes
    default:
        break
    }

    return state
}
