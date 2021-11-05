//
//  AppDelegate.swift
//  PlantCare
//
//  Created by Eric Alas on 2021-11-01.
//

import Foundation
import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        plantCareStore.dispatch(PlantCareThunkLaunch)
        return true
    }
}
