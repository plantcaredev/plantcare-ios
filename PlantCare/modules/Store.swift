//
//  Store.swift
//  PlantCare
//
//  Created by Eric Alas on 2021-11-04.
//

import Auth0
import Foundation
import ReSwift
import ReSwiftThunk

struct AppState: Hashable {
    var plantCare = PlantCareState()
    var plants = PlantsState()
    var homes = HomesState()
}

func appReducer(action: Action, state: AppState?) -> AppState {
    return AppState(
        plantCare: plantCareReducer(action: action, state: state?.plantCare),
        plants: plantsReducer(action: action, state: state?.plants),
        homes: homesReducer(action: action, state: state?.homes)
    )
}

let AuthApi = AuthApiClass()
let thunkMiddleware: Middleware<AppState> = createThunkMiddleware()
let plantCareStore = Store<AppState>(reducer: appReducer, state: nil, middleware: [thunkMiddleware])
