//
//  SpeedRunViewModel.swift
//  Clicker
//
//  Created by James Erringham-Bruce on 03/07/2021.
//

import SwiftUI

final class SpeedRunViewModel: GameViewModel {
    @AppStorage("speedrun_highscore") var highScore: Int = 0
    
    func checkHighScore() {
        if (currentScore > highScore) {
            highScore = currentScore
        }
    }
}
