//
//  CustomButton.swift
//  WordsGame
//
//  Created by Артем Парфенов on 14.02.2024.
//

import SwiftUI

struct CustomButton: View {

    @Binding var buttonTitle: String

    var body: some View {

        Button {
            print(#function)
        } label: {
            Text(buttonTitle)
        }
        .padding()
        .font(.system(size: 20))
        .foregroundColor(.white)
        .background(.teal)
        .cornerRadius(20)
        .padding(.top, 50)
    }
    
}
