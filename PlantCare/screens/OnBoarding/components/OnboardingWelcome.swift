//
//  OnboardingWelcome.swift
//  PlantCare
//
//  Created by Eric Alas on 2021-11-08.
//

import SwiftUI

struct OnboardingWelcome: View {
    @Binding var tabSelection: Int

    var body: some View {
        VStack {
            VStack {

                Text("Welcome,")
                    .foregroundColor(.white)
                    .font(.custom("Mulish-ExtraBold", size: 30))
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("Plant Lover")
                    .foregroundColor(.white)
                    .font(.custom("Mulish-ExtraBold", size: 34))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom)
                Text("We just need to collect some basic information before we get started!")
                    .foregroundColor(.white)
                    .font(.custom("Mulish-Regular", size: 16))
                    .frame(maxWidth: .infinity, alignment: .leading)
                HStack {
                    Spacer()
                    Button {
                        withAnimation {
                            self.tabSelection = 2
                        }
                    } label: {
                        Text("Let's get started!")
                            .foregroundColor(Color("DarkPurple"))
                            .padding()
                            .background(.white)
                            .cornerRadius(4)
                    }
                }
            }
                .padding()
            GeometryReader { geo in
                Image("GardeningMan")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geo.size.width)

            }

        }
    }
}

//struct OnboardingWelcome_Previews: PreviewProvider {
//    static var previews: some View {
//        OnboardingWelcome()
//    }
//}
