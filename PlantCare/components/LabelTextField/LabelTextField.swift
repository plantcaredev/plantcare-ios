//
//  LabelTextField.swift
//  PlantCare
//
//  Created by Eric Alas on 2021-11-05.
//

import SwiftUI

struct LabelTextField: View {
    var label: String
    var placeholder: String
    @Binding var value: String

    var body: some View {
        VStack(alignment: .leading) {
            Text(label)
                .font(.headline)
            TextField(placeholder, text: $value)
                .padding(.all)
                .background(Color(red: 239.0 / 255.0, green: 243.0 / 255.0, blue: 244.0 / 255.0, opacity: 1.0))
                .cornerRadius(5.0)
        }
            .padding(.horizontal, 15)
    }
}

//struct LabelTextField_Previews: PreviewProvider {
//    static var previews: some View {
//        LabelTextField()
//    }
//}
