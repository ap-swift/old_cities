//
//  TitleText.swift
//  WordsGame
//
//  Created by Артем Парфенов on 14.02.2024.
//

import SwiftUI

struct TitleText: View {

    var body: some View {

        Text("Words Game")
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.yellow)
            .font(.system(size: 28))
            .fontWeight(.bold)
            .cornerRadius(16)
            .foregroundColor(.blue)
    }
}
