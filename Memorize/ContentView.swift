//
//  ContentView.swift
//  Memorize
//
//  Created by Mehul Agarwal on 29/10/24.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["👻", "🎃", "🕷️", "😈", "💀", "🕸️", "🧙", "🙀", "👹", "😱", "☠️", "🍭"]
    @State var CardCount = 4
    var body: some View {
        VStack {
            ScrollView {
                Cards
            }
            Spacer()
            CardCountAdjusters
        }
        .padding()
        
    }
    var Cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach (0..<CardCount, id: \.self) { index in
                CardView(Content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
    }
    var CardCountAdjusters: some View {
        HStack {
            CardRemover
            Spacer()
            CardAdder
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
    func CardCountAdjuster(by Offset: Int, symbol: String) -> some View {
        Button(action: {
            CardCount = CardCount + Offset
        }, label:  {
            Image(systemName: symbol)
        })
        .disabled(CardCount + Offset < 1 || CardCount + Offset > emojis.count)
    }
    var CardAdder: some View {
        CardCountAdjuster(by: +1, symbol: "rectangle.stack.badge.plus.fill")
        
    }
    var CardRemover: some View {
        CardCountAdjuster(by: -1, symbol: "rectangle.stack.badge.minus.fill")
    }

}
struct CardView: View {
    @State var isFaceUp = true
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

