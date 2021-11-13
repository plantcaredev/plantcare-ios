//
//  PlantCare.selectors.swift
//  PlantCare
//
//  Created by Eric Alas on 2021-11-10.
//

import Foundation

let selectPlantCareState = createSelector(selector1: { (state: AppState) in return state }, { state in return state.plantCare })

let selectName = createSelector(selector1: selectPlantCareState, { state in state.name })

let selectEmail = createSelector(selector1: selectPlantCareState, { state in state.email })

let selectSelectedView = createSelector(selector1: selectPlantCareState, { state in state.selectedView })

let selectLoggedInStatus = createSelector(selector1: selectPlantCareState, { state in state.loggedInStatus })

let selectNeedsOnBoarding = createSelector(selector1: selectPlantCareState, { state in state.needsOnBoarding })

let selectShowNavigationBar = createSelector(selector1: selectPlantCareState, { state in !state.hideNavigation })

let selectShouldShowOnBoarding = createSelector(selector1: selectLoggedInStatus, selector2: selectNeedsOnBoarding, { loggedInStatus, needsOnBoarding in
    return loggedInStatus == .loggedIn && needsOnBoarding
})

let selectShouldOpenMainScreen = createSelector(selector1: selectLoggedInStatus, selector2: selectNeedsOnBoarding, { loggedInStatus, needsOnBoarding in
    return loggedInStatus == .loggedIn && !needsOnBoarding
})
