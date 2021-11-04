//
//  ContentView.swift
//  PlantCare
//
//  Created by Eric Alas on 2021-11-01.
//

import SwiftUI

struct ContentView: View {
    @StateObject var userData: UserData = UserData()

    var body: some View {
        VStack {
            if userData.isLoggedIn() {
                VStack {
                    Text("Hello \(userData.userName)")
                    Button(action: userData.logout) {
                        Text("Logout")
                    }
                }
            }
            if userData.isLoggedIn() == false {
                Button(action: userData.login) {
                    Text("Please Sign in")
                }
            }
            
            
        }
    }

}
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
