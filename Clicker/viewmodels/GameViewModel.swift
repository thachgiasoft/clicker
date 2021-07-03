//
//  GameViewModel.swift
//  Clicker
//
//  Created by James Erringham-Bruce on 03/07/2021.
//

import SwiftUI

class GameViewModel: ObservableObject {
    @Published var showIntersitialAd: Bool = false
    @Published var timer = Timer.publish(every: 1, on: .main, in: .common)
    @Published var timeRemaining = 30
    @Published var currentScore: Int = 0
    @Published var alertItem: AlertItem?
    @Published var target: Target = Target.init(imageName: "target",
                                                size: 50,
                                                randX: 0,
                                                randY: 0);
    
    func countdown() {
        if timeRemaining > 0 {
            timeRemaining -= 1
        } else {
            alertItem = AlertContext.timeOut
        }
    }
    
    func targetWasHit() {
        if (currentScore == 0) {
            _ = timer.connect()
        }
        increaseScore()
        self.target.randX = getRandX()
        self.target.randY = getRandY()
    }
    
    func resetGame() {
        self.currentScore = 0
        self.timeRemaining = 30
        self.timer = Timer.publish(every: 1, on: .main, in: .common)
        
        changePosition()
        self.showIntersitialAd.toggle()
    }
    
    func increaseScore() {
        self.currentScore += 1
    }
    
    func getRandX() -> CGFloat {
        let width = UIScreen.main.bounds.size.width
        let left: CGFloat = self.target.size/2
        let right: CGFloat = width - left - self.target.size/2
        
        return CGFloat.random(in: left...right)
    }
    
    func getRandY() -> CGFloat {
        let height = UIScreen.main.bounds.size.height
        let top: CGFloat = 150
        let bottom: CGFloat = height - top - self.target.size/2
        
        return CGFloat.random(in: top...bottom)
    }
    
    func changePosition() {
        self.target.randX = getRandX()
        self.target.randY = getRandY()
    }
}
