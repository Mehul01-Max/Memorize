//
//  ContentView.swift
//  Memorize
//
//  Created by Mehul Agarwal on 29/10/24.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["👻", "🎃", "🕷️", "😈"]
    var body: some View {
        HStack {
            ForEach (emojis.indices, id: \.self) { index in
                CardView(Content: emojis[index])
            }
        }
        .foregroundColor(.orange)
        .padding()
    }
}
struct CardView: View {
    @State var isFaceUp = true
    var Content: String
    var body: some View {

        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            if isFaceUp {
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 2)
                Text(Content).font(.largeTitle)
            }
            else {
                base
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}
#Preview {
    ContentView()
}

