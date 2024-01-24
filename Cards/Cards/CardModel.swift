//
//  CardModel.swift
//  Cards
//
//  Created by Nicolai Bodean on 25.01.2024.
//

import SwiftUI

//Card Model

struct Card: Identifiable {
    var id = UUID()
    var title: String
    var headline: String
    var imageName: String
    var callToAction: String
    var message: String
    var gradientColors: [Color]
}
