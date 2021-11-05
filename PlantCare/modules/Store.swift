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

struct AppState {
    var plantCare: PlantCareState = PlantCareState()
}

func appReducer(action: Action, state: AppState?) -> AppState {
    return AppState(
        plantCare: plantCareReducer(action: action, state: state?.plantCare)
    )
}

let AuthApi = AuthApiClass()
let thunkMiddleware: Middleware<AppState> = createThunkMiddleware()
let plantCareStore: Store<AppState> = Store<AppState>(reducer: appReducer, state: nil, middleware: [thunkMiddleware])
