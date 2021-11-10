//
//  Store.swift
//  PlantCare
//
//  Created by Eric Alas on 2021-11-04.
//

import Foundation
import ReSwift
import ReSwiftThunk
import Auth0

struct AppState: Hashable {
    var plantCare: PlantCareState = PlantCareState()
    var plants: PlantsState = PlantsState()
}

func appReducer(action: Action, state: AppState?) -> AppState {
    return AppState(
        plantCare: plantCareReducer(action: action, state: state?.plantCare),
        plants: plantsReducer(action: action, state: state?.plants)
    )
}

let AuthApi = AuthApiClass()
let thunkMiddleware: Middleware<AppState> = createThunkMiddleware()
let plantCareStore: Store<AppState> = Store<AppState>(reducer: appReducer, state: nil, middleware: [thunkMiddleware])
