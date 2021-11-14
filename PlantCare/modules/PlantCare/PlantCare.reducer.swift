//
//  PlantCare.reducer.swift
//  PlantCare
//
//  Created by Eric Alas on 2021-11-04.
//

import Foundation
import ReSwift

func plantCareReducer(action: Action, state: PlantCareState?) -> PlantCareState {
    var state = state ?? PlantCareState()

    switch action {
    case let action as PlantCareActionSetUserData:
        state.name = action.newName
        state.email = action.newEmail
    case let action as PlantCareActionSetLoggedInStatus:
        state.loggedInStatus = action.loggedInStatus
        state.needsOnBoarding = action.needsOnBoarding
    case let action as PlantCareActionSetNeedsOnBoard:
        state.needsOnBoarding = action.needsOnBoarding
    case let action as PlantCareActionSetSelectedView:
        state.selectedView = action.selectedView
    case let action as PlantCareActionUpdateHideNavigation:
        state.hideNavigation = action.hideNavigation
    default:
        break
    }

    return state
}
