//
//  EmptyView.swift
//  WordsGame
//
//  Created by Артем Парфенов on 20.02.2024.
//

import SwiftUI

struct EmptyView: View {
    
    var body: some View {
        Text("You didn't type names, go back and fill fields")
            .padding()
            .frame(maxWidth: .infinity)
            .font(.system(size: 20))
            .fontWeight(.bold)
            .cornerRadius(16)
            .foregroundColor(.blue)
    }
}

#Preview {
    EmptyView()
}




