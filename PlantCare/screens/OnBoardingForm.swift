//
//  OnBoardingForm.swift
//  PlantCare
//
//  Created by Eric Alas on 2021-11-05.
//

import SwiftUI

struct OnBoardingForm: View {
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
        Form {
            Section(header: Text("Full Name")) {
                TextField("Full Name", text: $fullNameFormValue)
            }
            Section(header: Text("Email")) {
                TextField("Full Name", text: $emailFormValue)
            }
        }
    }
}

//struct OnBoardingForm_Previews: PreviewProvider {
//    static var previews: some View {
//        OnBoardingForm()
//    }
//}
