//
//  CardView.swift
//  Cards
//
//  Created by Nicolai Bodean on 24.01.2024.
//

import SwiftUI

struct CardView: View {
    
    @State private var fadeIn = false
    @State private var moveDownward = false
    @State private var moveUpword = false
    @State private var showAlert = false
    
    var card: Card
    var hapticImpact = UIImpactFeedbackGenerator(style: .heavy)
    
    var body: some View {
        ZStack {
            Image(card.imageName)
                .opacity(fadeIn ? 1.0 : 0.0)
            
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
            .offset(y: moveDownward ? -217 : 300)
            
            Button(action: {
                playSound(sound: "sound-chime", type: "mp3")
                self.hapticImpact.impactOccurred()
                self.showAlert.toggle()
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
            .offset(y: moveUpword ? 210 : 300)
            
        }//ZStack
        .frame(width: 335, height: 545)
        .background(LinearGradient(colors: card.gradientColors, startPoint: .top, endPoint: .bottom))
        .cornerRadius(16)
        .shadow(radius: 8)
        .onAppear() {
            withAnimation(.linear(duration: 1.2)) {
                self.fadeIn.toggle()
            }
            withAnimation(.linear(duration: 0.8)) {
                self.moveDownward.toggle()
                self.moveUpword.toggle()
            }
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text(card.title),
                message: Text(card.message),
                dismissButton: .default(Text("OK"))
            )
        }
    }
}

#Preview {
    CardView(card: cardData[1])
}
