//
//  CardView.swift
//  Cards
//
//  Created by Nicolai Bodean on 24.01.2024.
//

import SwiftUI

struct CardView: View {
    
    var card: Card
    
    var gradient: [Color] = [Color("Color01"), Color("Color02")]
    
    var body: some View {
        ZStack {
            Image(card.imageName)
            
            VStack{
                Text(card.title)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
                    
                Text(card.headline)
                    .fontWeight(.light)
                    .foregroundStyle(.white)
                    .italic()
                
            }//VStack
            .offset(y: -218)
            
            Button(action: {
                playSound(sound: "sound-chime", type: "mp3")
            }) {
                HStack {
                    Text(card.callToAction.uppercased())
                        .fontWeight(.heavy)
                        .foregroundStyle(.white)
                    .accentColor(Color.white)
                    
                    Image(systemName: "arrow.right.circle")
                        .font(Font.title.weight(.medium))
                        .accentColor(.white)
                }
                .padding(.vertical)
                .padding(.horizontal, 24)
                .background(
                    LinearGradient(gradient: Gradient(colors: card.gradientColors), startPoint: .leading, endPoint: .trailing)
                    .clipShape(Capsule())
                    .shadow(color: Color("ColorShadow"), radius: 6, x: 0, y: 3)
                )
            }
            .offset(y: 210)
            
        }//ZStack
        .frame(width: 335, height: 545)
        .background(LinearGradient(colors: card.gradientColors, startPoint: .top, endPoint: .bottom))
        .cornerRadius(16)
        .shadow(radius: 8)
    }
}

#Preview {
    CardView(card: cardData[1])
}
