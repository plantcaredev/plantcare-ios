//
//  Plants.actions.swift
//  PlantCare
//
//  Created by Eric Alas on 2021-11-10.
//

import Foundation
import ReSwift
import ReSwiftThunk

struct PlantActionSetFetchingPlants: Action {
    var isFetching: Bool
}

let PlantActionFetchPlantsRequested = Thunk<AppState> { dispatch, getState in
    Task(priority: .high) {
        dispatch(PlantActionSetFetchingPlants(isFetching: true))
        await Task.sleep(5_000_000_000) // mock call server
        dispatch(PlantActionSetFetchingPlants(isFetching: false))
    }
}
