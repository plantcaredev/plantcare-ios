//
//  OnboardingInfoConfirmation.swift
//  PlantCare
//
//  Created by Eric Alas on 2021-11-08.
//

import SwiftUI
import ReSwift

struct OnboardingInfoConfirmation: View {
    @ObservedObject private var store = ObservableStore(store: plantCareStore)

    @Binding var name: String
    @Binding var email: String

    var body: some View {
        VStack {
            Spacer()
            HStack {
                Text("Help us by providing the following information.")
                    .foregroundColor(.white)
                    .font(.custom("Mulish-Regular", size: 16))
                Spacer()
            }
                .padding([.leading, .trailing])
                .padding([.leading, .trailing])


            VStack {
                VStack {
                    LabelTextField(label: "Full Name", placeholder: "John Smith", value: $name, labelColor: .white)
                    LabelTextField(label: "Email", placeholder: "example@example.com", value: $email, labelColor: .white)

                }
                VStack {
                    Button {
                        store.dispatch(PlantCareActionSetUserData(newName: name, newEmail: email))
                        store.dispatch(PlantCareActionSetNeedsOnBoard(needsOnBoarding: false))
                    } label: {

                        Text("Confirm")
                            .foregroundColor(Color("DarkPurple"))
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(.white)
                            .cornerRadius(4)
                    }

                    Button {
                        store.dispatch(PlantCareThunkLogout)
                    } label: {
                        Text("Logout")
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color("DarkPurple"))
                            .border(Color.white, width: 2)
                            .cornerRadius(4)
                    }

                }
                    .padding()
            }
                .padding()
            Spacer()
            HStack {
                Spacer()
                Image("SmallPlant1")
                    .padding()
            }

        }
    }
}

//struct OnboardingInfoConfirmation_Previews: PreviewProvider {
//    static var previews: some View {
//        OnboardingInfoConfirmation()
//    }
//}
