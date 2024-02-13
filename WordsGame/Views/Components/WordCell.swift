//
//  WordCell.swift
//  WordsGame
//
//  Created by Артем Парфенов on 21.02.2024.
//

import SwiftUI

struct WordCell: View {

    let word: String

    var body: some View {

        HStack(content: {
            Text(word)
                .foregroundStyle(.white)
                .listRowSeparator(.hidden)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                .padding()
                .font(.caption2)
            Text("\(word.count)")
                .foregroundStyle(.white)
                .padding()
                .font(.caption2)
        })
    }
}

#Preview {
    WordCell(word: "Magnit")
}
