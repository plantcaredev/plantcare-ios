//
//  Plants.selectors.swift
//  PlantCare
//
//  Created by Eric Alas on 2021-11-10.
//

import Foundation

let selectPlantState = createSelector(selector1: {(state: AppState) in return state}, {state in return state.plants})

let selectPlants = createSelector(selector1: selectPlantState, {plantState in plantState.plants})
