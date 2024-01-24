//
//  ContentView.swift
//  Cards
//
//  Created by Nicolai Bodean on 24.01.2024.
//

import SwiftUI

struct ContentView: View {
    
    var cards: [Card] = cardData
    
    var body: some View {
        
        ScrollView(.horizontal,showsIndicators: false) {
            HStack(alignment: .center, spacing: 20) {
                ForEach(cards) { item in
                   CardView(card: item)
                   
                }
            }//HStack
            .padding(30)
        }
        
    }
}
#Preview {
    ContentView(cards: cardData)
}
