//
//  GameView.swift
//  WordsGame
//
//  Created by Артем Парфенов on 14.02.2024.
//

import SwiftUI

struct GameView: View {

    @Environment(\.dismiss) private var dismiss

    @State var wordTextField: String = ""
    @State var isConfirmationDialogShowed = false
    @State var isAlertPresented = false
    @State var alertText = ""
    @State var isWonAlertPresented = false
    @State var wonAlertText = ""
    @ObservedObject var viewModel: GameViewModel

    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    isConfirmationDialogShowed.toggle()
                }, label: {
                    Text("Exit")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(8)
                        .padding(.horizontal, 10)
                        .background(Color("Orange"))
                        .cornerRadius(14)
                        .padding(.top, 20)
                })
                Spacer()
            }

            TitleText()
                .padding(.vertical, 10)

            HStack(spacing: 12) {

                VStack() {
                    Text("\(viewModel.player1.score)")
                        .font(.system(size: 40))
                        .foregroundColor(.blue)
                    Text(viewModel.player1.name)
                        .padding(.top, 1)
                        .font(.system(size: 20))
                        .foregroundColor(.blue)
                }
                .padding(20)
                .frame(
                    width: screenBounds.width / 2.2,
                    height: screenBounds.width / 2.2
                )
                .background(Color("BluePink"))
                .cornerRadius(12)
                .shadow(color: viewModel.isFirst ? .red : .clear,
                        radius: 10)

                VStack() {
                    Text("\(viewModel.player2.score)")
                        .font(.system(size: 40))
                        .foregroundColor(.blue)
                    Text(viewModel.player2.name)
                        .padding(.top, 1)
                        .font(.system(size: 20))
                        .foregroundColor(.blue)
                }
                .padding(20)
                .frame(
                    width: screenBounds.width / 2.2,
                    height: screenBounds.width / 2.2
                )
                .background(Color("LightPink"))
                .cornerRadius(12)
                .shadow(color: viewModel.isFirst ? .clear : .purple,
                        radius: 10)
            }

            CustomTextField(placeHolder: "Type your word", userInput: $wordTextField)
                .padding(.vertical, 10)

            Button {

                var score = 0

                do {
                    try score = viewModel.checkWord(word: wordTextField)
                } catch WordError.theSameWord {
                    alertText = "Use a new word"
                    isAlertPresented.toggle()
                } catch WordError.littleWord {
                    alertText = "Enter a longer word"
                    isAlertPresented.toggle()
                } catch {
                    alertText = "Unknown error"
                    isAlertPresented.toggle()
                }

                let winner = viewModel.whoWins(score1: viewModel.player1.score, score2: viewModel.player2.score, scoreToWin: viewModel.scoreToWin)
                if winner != Result.goOn {
                    if winner == Result.draw {
                        wonAlertText = "Congratulations. It's a draw"
                        isWonAlertPresented.toggle()
                    } else if winner == Result.firstPlayer {
                        wonAlertText = "Congratulations \(viewModel.player1.name)"
                        isWonAlertPresented.toggle()
                    } else if winner == Result.secondPlayer {
                        wonAlertText = "Congratulations \(viewModel.player2.name)"
                        isWonAlertPresented.toggle()
                    }
                }

                if score > 1 {
                    print("Ready")
                    self.wordTextField = ""
                }

            } label: {
                Text("Ready")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .background(.teal)
                    .cornerRadius(20)
                    .padding(.top, 10)
            }

            List {

                ForEach((0 ..< self.viewModel.words.count).sorted(by: >), id: \.description) { item in
                    WordCell(word: self.viewModel.words[item])
                        .background(item % 2 == 0 ? Color("BluePink") : Color("LightPink"))
                        .listRowInsets(EdgeInsets())
                }

            }
            .listStyle(.plain)
            .frame(maxWidth: .infinity, maxHeight: .infinity)

        }
        .padding()
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        .background(Color(.green))
        .navigationBarBackButtonHidden()
        .confirmationDialog("Are you sure?", isPresented: $isConfirmationDialogShowed, titleVisibility: .visible) {
            Button(role: .destructive) {
                self.dismiss()
            } label: {
                Text("Yes")
            }
            Button(role: .cancel) { } label: {
                Text("No")
            }
        }
        .alert(wonAlertText, isPresented: $isWonAlertPresented, actions: {
            Button {
                self.dismiss()
            } label: {
                Text("Try again")
            }
        })
        .alert(alertText, isPresented: $isAlertPresented, actions: { Text("OK") })

    }
}

#Preview {
    GameView(viewModel: GameViewModel(player1: Player(name: "Вася"), player2: Player(name: "Вася2"), scoreToWin: 100))
}
