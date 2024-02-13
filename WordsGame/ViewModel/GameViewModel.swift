//
//  GamveViewModel.swift
//  WordsGame
//
//  Created by Артем Парфенов on 15.02.2024.
//

import Foundation

enum WordError: Error {
    case theSameWord
    case littleWord
}

enum Result {
    case firstPlayer
    case secondPlayer
    case draw
    case goOn
}


class GameViewModel: ObservableObject {

    @Published var player1: Player
    @Published var player2: Player
    @Published var words = [String]()
    @Published var scoreToWin: Int
    var isFirst = true

    init(player1: Player, player2: Player, scoreToWin score: Int) {
        self.player1 = player1
        self.player2 = player2
        self.scoreToWin = score
    }

    //Бизнес-логика

    private func validate(word: String) throws {
        let word = word.uppercased()

        print("добавленные ранее слова", words)
        guard !(words.contains(word)) else {
            print("Это слово уже использовалось. Попробуй еще раз")
            throw WordError.theSameWord
        }

        guard word.count > 1 else {
            print("Введи больше одной буквы")
            throw WordError.littleWord
        }

        print("Валидация прошла")
        return
    }

    func checkWord(word: String) throws -> Int {

        do {
            try self.validate(word: word)
        } catch {
            throw error
        }


        words.append(word.uppercased())

        if isFirst {
            player1.score += word.count
            print("player1.score", player1.score)
        } else {
            player2.score += word.count
            print("player2.score", player2.score)
        }

        isFirst.toggle()

        return word.count
    }

    func whoWins(score1: Int, score2: Int, scoreToWin: Int) -> Result {
        if isFirst == true {
            if score2 >= scoreToWin || score1 >= scoreToWin {
                if score2 == score1 {
                    return Result.draw
                } else if score2 > score1 {
                    return Result.secondPlayer
                } else if score1 > score2 {
                    return Result.firstPlayer
                }
            }
        }
        return Result.goOn
    }

    func shouldResetGame() {
        self.player1 = Player(name: "", score: 0)
        self.player2 = Player(name: "", score: 0)
        self.scoreToWin = 100
        self.words = []
    }
}
