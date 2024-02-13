//
//  ContentView.swift
//  WordsGame
//
//  Created by Артем Парфенов on 13.02.2024.
//

import SwiftUI

struct StartGameView: View {

    @State var firstPlayerUserName: String = ""
    @State var secondPlayerUserName: String = ""
    @State var selectedOption: Int = 100
    @State var isAlertPresented = false

    private var isNamedFilled = false


    var body: some View {

        let player1 = Player(name: self.firstPlayerUserName)
        let player2 = Player(name: self.secondPlayerUserName)
        let gameViewModel = GameViewModel(player1: player1, player2: player2, scoreToWin: selectedOption)

        NavigationStack {
            VStack {
                TitleText()
                    .padding(.bottom, 40)
                    .scaleEffect(1.2, anchor: .bottom)
                HStack(content: {
                    WordsNumberPickerView(selectedOption: $selectedOption)
                })

                CustomTextField(userInput: $firstPlayerUserName)
                CustomTextField(userInput: $secondPlayerUserName)

                NavigationLink {
                    let startGameViewModel = StartGameViewModel()
                    if startGameViewModel.checkPlayersNames(players: player1, player2) == true  {
                        GameView(viewModel: gameViewModel)
                    } else {
                        EmptyView()
                    }
                } label: {
                    Text("Start")
                        .padding()
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                        .background(.teal)
                        .cornerRadius(20)
                        .padding(.top, 50)
                }
            }
            .padding()
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            .background(Color(.blue))
            .alert("Type players names?",
                   isPresented: $isAlertPresented) {
                Button {

                } label: {
                    Text("Ок")
                }

            }
        }
    }
}


#Preview {
    StartGameView()
}
