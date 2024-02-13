//
//  WordsCountPickerView.swift
//  WordsGame
//
//  Created by Артем Парфенов on 20.02.2024.
//

import SwiftUI

struct WordsNumberPickerView: View {

    @Binding var selectedOption: Int

    var body: some View {

        HStack {
            Text("Select max number of letters")
                .frame(maxWidth: .infinity)
                .font(.title3)
                .foregroundColor(Color(UIColor.black))


            Picker("Выберите значение", selection: $selectedOption) {
                Text("100").tag(100)
                Text("300").tag(300)
                Text("500").tag(500)
                Text("700").tag(700)
                Text("1000").tag(1000)
            }
            .pickerStyle(MenuPickerStyle())
            .font(.system(size: 20))
            .fontWeight(.bold)
            .background(Color(UIColor(red: 20/255, green: 255/255, blue: 200/255, alpha: 1)))
            .foregroundColor(Color(UIColor.black))
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical)

    }
}
