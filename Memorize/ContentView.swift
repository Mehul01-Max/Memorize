//
//  ContentView.swift
//  Memorize
//
//  Created by Mehul Agarwal on 29/10/24.
//

import SwiftUI

struct ContentView: View {
    var birds = ["🕊️", "🦅", "🦆", "🦜", "🐥", "🦢", "🐓", "🦃", "🦉", "🦉", "🦤", "🪿", "🐦‍⬛"]
    let cars = ["🚗", "🚙", "🏎️", "🚕", "🚓", "🚘", "🚖", "🚔"]
    let animals = ["🐶", "🐱", "🐭", "🐹", "🐰", "🦇", "🐻", "🐼", "🐨", "🐯", "🦁", "🐮"]
    @State var currentCards: [String] = []
    var body: some View {
        VStack {
            Text("Memorize!")
                .font(.largeTitle)
            ScrollView {
                Cards
            }
            Spacer()
            CardButtons
        }
        .onAppear {
            currentCards = birds.shuffled()
        }
        .padding()
        
    }
    var Cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 60))]) {
            ForEach (currentCards.indices, id: \.self) { index in
                CardView(Content: currentCards[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
    }
    var CardButtons: some View {
        HStack {
            Spacer()
            birdCards
            Spacer()
            carCards
            Spacer()
            animalCards
            Spacer()
        }
        .foregroundStyle(.blue)
 
    }
    var birdCards: some View {
        VStack {
            Button(action: {
                currentCards = birds.shuffled()
            }, label: {
                Image(systemName: "bird")
            })
            .font(.largeTitle)
            Text("Birds")
        }
    }
    var carCards: some View {
        VStack {
            Button(action: {
                currentCards = cars.shuffled()
            }, label: {
                Image(systemName: "car")
            })
            .font(.largeTitle)
            Text("Cars")
        }
    }
    var animalCards: some View {
        VStack {
            Button(action: {
                currentCards = animals.shuffled()
            }, label: {
                Image(systemName: "pawprint")
            })
            .font(.largeTitle)
            Text("Animals")
            
        }
    }

}
struct CardView: View {
    @State var isFaceUp = false
    var Content: String
    var body: some View {

        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 2)
                Text(Content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}
#Preview {
    ContentView()
}

