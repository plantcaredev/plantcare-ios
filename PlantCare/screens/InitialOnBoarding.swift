//
//  InitialOnBoarding.swift
//  PlantCare
//
//  Created by Eric Alas on 2021-11-05.
//

import SwiftUI
import ReSwift

struct InitialOnBoarding: View {
    @ObservedObject private var store = ObservableStore(store: plantCareStore)

    var fullName: String
    var email: String

    @State var fullNameFormValue: String
    @State var emailFormValue: String

    init (fullName: String, email: String) {
        self.fullName = fullName
        self.email = email
        _fullNameFormValue = State(wrappedValue: fullName)
        _emailFormValue = State(wrappedValue: email)
    }

    var body: some View {
        VStack {
            Text("Welcome! We just need some information from you before we begin.")
            LabelTextField(label:"Full Name", placeholder: "John Smith", value: $fullNameFormValue)
            LabelTextField(label:"Email", placeholder: "example@example.com", value: $emailFormValue)
            Spacer()
            HStack {
                Button {
                    (store.dispatch as (_ action: Action) -> Void)(PlantCareActionSetUserData(newName: fullNameFormValue, newEmail: emailFormValue))
                    (store.dispatch as (_ action: Action) -> Void)(PlantCareActionSetNeedsOnBoard(needsOnBoarding: false))
                } label: {
                    Text("Confirm")
                }
                
                Button(action: store.dispatch(PlantCareThunkLogout)) {
                    Text("Logout")
                }
            }
        }
        .padding(.all)
    }
}


//struct InitialOnBoarding_Previews: PreviewProvider {
//    static var previews: some View {
//        InitialOnBoarding()
//    }
//}

