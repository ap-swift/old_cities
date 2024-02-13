//  WordsGame
//
//  Created by Артем Парфенов on 14.02.2024.
//

import SwiftUI
struct CustomTextField: View {

    var placeHolder = "Type your name"
    @Binding var userInput: String

    var body: some View {
        VStack {
            TextField(placeHolder, text: $userInput)
                .padding()
                .font(.system(size: 16))
                .fontWeight(.bold)
                .background(Color(UIColor(red: 20/255, green: 255/255, blue: 200/255, alpha: 1)))
                .foregroundColor(Color(UIColor.black))
                .cornerRadius(16)
//                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
    }
}

