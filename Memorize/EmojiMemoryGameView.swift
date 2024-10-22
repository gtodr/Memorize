//
//  ContentView.swift
//  Memorize
//
//  Created by dwayne on 2023/6/20.
//


import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
//    let gestures: Int = 0
//    let faces: Int = 1
//    let animals: Int = 2
//    @State var emojiTheme: Int = 0
//    @State var cardCount: Int = 8
    
    // 视图主体
    var body: some View {
        VStack {
            Text("👁Memorize")
                .font(.title)
            ScrollView {
                cards
                    .animation(.default, value: viewModel.cards)
            }
            Spacer()
            Button("Shuffle") {
                viewModel.shuffle()
            }
//            themeButtons
//            cardCountAdjusters
        }
        .padding()
    }
    
//    var cardCountAdjusters: some View {
//        HStack {
//            cardAdder
//           Spacer().frame(width: 50)
//            cardRemover
//        }
//        .font(.title)
//        .padding()
//    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85), spacing: 0)], spacing: 0) {
            ForEach(viewModel.cards) {card in
                CardView(card)
                    .aspectRatio(2/3, contentMode: .fit)
                    .padding(4)
                    .onTapGesture {
                        viewModel.choose(card)
                    }
            }
        }
        .foregroundColor(.orange)
    }
    
//    func cardCountAdjuster (by offset: Int, symbol: String) -> some View {
//        Button(action: {
//            cardCount += offset
//        },label: {
//            Image(systemName: symbol)
//        })
//        .disabled(cardCount + offset < 1 || cardCount + offset > Emojis[emojiTheme].count)
//    }
//
//    var cardAdder: some View {
//        cardCountAdjuster(by: 1, symbol: "rectangle.stack.badge.plus.fill")
//    }
//
//    var cardRemover: some View {
//        cardCountAdjuster(by: -1, symbol: "rectangle.stack.badge.minus.fill")
//    }
//
//    func selectThemeButton (theme: String, symbol: String) -> some View {
//        var selected: Int = 0
//        switch theme {
//            case "gestures" :
//                selected = gestures
//            case "faces" :
//                selected = faces
//            case "animals" :
//                selected = animals
//            default :
//                selected = gestures
//        }
//        return Button(action: {
//            //结构体是值类型，值改变时会重新渲染视图
//            emojiTheme = selected
//            cardCount = Emojis[emojiTheme].count
//            Emojis[emojiTheme].shuffle()
//        }){
//            VStack {
//                Image(systemName: symbol)
//                    .font(.largeTitle)
//                Text(theme)
//                    .font(.system(size: 15))
//            }
//        }
//    }
//
//    var themeButtons: some View {
//        HStack {
//            selectThemeButton(theme: "gestures", symbol: "hand.thumbsup.circle")
//            Spacer()
//            selectThemeButton(theme: "faces", symbol: "face.smiling")
//            Spacer()
//            selectThemeButton(theme: "animals", symbol: "pawprint.circle")
//        }
//        .font(.system(size: 10))
//        .frame(height: 10)
//        .padding()
//    }
    
}


struct CardView: View{
    let card: MemoryGame<String>.Card
    
    init(_ card: MemoryGame<String>.Card) {
        self.card = card
    }
    
    var body: some View{
        ZStack{
            let base = RoundedRectangle(cornerRadius: 12)
            // Group: For each thing in '{}', do sth. (like .opacity(isFaceUp ? 1 : 0))
            Group{
                base.foregroundColor(Color(.white))
                base.strokeBorder(lineWidth: 2)
                Text(card.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
            }
            .opacity(card.isFaceUp ? 1 : 0)  // opacity: 不透明
            base.fill()
                .opacity(card.isFaceUp ? 0 : 1)
            //如果isFaceUp为true，则Group的视图将完全不透明（opacity为1），而base.fill()将完全透明（opacity为0）；反之亦然。
        }
//        .onTapGesture {
////            print("taped!")
//            isFaceUp.toggle()
//        }
        
    }
}


struct EmojiMemoryGameView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
