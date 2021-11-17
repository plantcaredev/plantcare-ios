//
//  Homes.selectors.swift
//  PlantCare
//
//  Created by Eric Alas on 2021-11-16.
//

import Foundation

let selectHomesState = createSelector(selector1: { (state: AppState) in state }, { state in state.homes })

let selectCurrentHome = createSelector(selector1: selectHomesState) { homes in
    homes.homes.first { $0.identifier == homes.selectedHome }
}

let selectHomes = createSelector(selector1: selectHomesState) { homes in
    homes.homes
}
