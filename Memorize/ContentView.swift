//
//  ContentView.swift
//  Memorize
//
//  Created by 徐德润 on 2023/6/20.
//

import SwiftUI

struct ContentView: View {
    
    let emojis: [String] = ["👏", "🤞", "🤌", "🫴", "👎", "🤚", "👇", "🖕"]
    @State var cardCount: Int = 4
    
    var body: some View {
        VStack {
            cards
            cardCountAdjusters
        }
        .padding()
    }
    
    var cardCountAdjusters: some View {
        HStack {
            cardAdder
           Spacer().frame(width: 50)
            CardRemover
        }
        .font(.largeTitle)
        .padding()
    }
    
    var cards: some View {
        HStack {
            ForEach(0..<cardCount, id: \.self) {index in
                CardView(content: emojis[index])
            }
        }
        .foregroundColor(.orange)
    }
    
    func cardCountAdjuster (by offset: Int, symbol: String) -> some View {
        Button(action: {
            cardCount += offset
        },label: {
            Image(systemName: symbol)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    
    var cardAdder: some View {
        cardCountAdjuster(by: 1, symbol: "rectangle.stack.badge.plus.fill")
    }
    
    var CardRemover: some View {
        cardCountAdjuster(by: -1, symbol: "rectangle.stack.badge.minus.fill")
    }
}


struct CardView: View{
    let content: String
    @State var isFaceUp: Bool = true
    
    var body: some View{
        ZStack{
            let base = RoundedRectangle(cornerRadius: 12)
            if isFaceUp{
                base.foregroundColor(Color(.white))
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }else {
                base
            }
        }
        .onTapGesture {
            print("taped!")
            isFaceUp.toggle()
        }
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
