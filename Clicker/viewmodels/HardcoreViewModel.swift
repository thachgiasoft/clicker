//
//  HardcoreViewModel.swift
//  Clicker
//
//  Created by James Erringham-Bruce on 03/07/2021.
//

import SwiftUI

final class HardcoreViewModel: GameViewModel {
    @AppStorage("hardcore_highscore") var highScore: Int = 0
    
    override init() {
        super.init()
        target.size = 20
        target.imageName = "plus"
    }
    
    func checkHighScore() {
        if (currentScore > highScore) {
            highScore = currentScore
        }
    }
}
