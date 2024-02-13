//
//  StartGameViewModel.swift
//  WordsGame
//
//  Created by Артем Парфенов on 20.02.2024.
//

import SwiftUI

class StartGameViewModel {

    func checkPlayersNames(players: Player...) -> Bool {

        for player in players {
            guard player.name.count >= 2 else {
                return false
            }
        }
        return true
    }
}
