//
//  Alerts.swift
//  Clicker
//
//  Created by James Erringham-Bruce on 03/07/2021.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    var title: Text
    var message: Text
    var buttonTitle: Text
}

struct AlertContext {
    static let timeOut = AlertItem(title: Text("Time Out"), message: Text("Is that all you got?"), buttonTitle: Text("Play again."))
    static let miss = AlertItem(title: Text("You Missed"), message: Text("You didnt hit the target!"), buttonTitle: Text("Play again."))
}

