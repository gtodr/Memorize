//
//  ContentView.swift
//  Memorize
//
//  Created by 徐德润 on 2023/6/20.
//

import SwiftUI

struct ContentView: View {
    
    @State var Emojis: [[String]] = [["👏","👏", "🤞","🤞", "🤌","🤌", "🫴","🫴", "🖕","🖕", ],
                            ["😀","😀", "😁","😁", "😆","😆", "😘","😘", "😗","😗", "🤪","🤪", "😇","😇",],
                            ["🐶", "🐶","🐯", "🐯","🦆","🦆", "🐱","🐱", "🐼","🐼", "🐔","🐔", "🦄","🦄", "🐒","🐒",],]
    let gestures: Int = 0
    let faces: Int = 1
    let animals: Int = 2
    @State var emojiTheme: Int = 0
    @State var cardCount: Int = 8
    
    // 视图主体
    var body: some View {
        VStack {
            Text("👁Memorize")
                .font(.largeTitle)
            ScrollView {
                cards
            }
            Spacer()
            themeButtons
//            cardCountAdjusters
        }
        .padding()
    }
    
    var cardCountAdjusters: some View {
        HStack {
            cardAdder
           Spacer().frame(width: 50)
            cardRemover
        }
        .font(.title)
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
            ForEach(0..<cardCount, id: \.self) {index in
                CardView(content: Emojis[emojiTheme][index]).aspectRatio(2/3, contentMode: .fit)
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
        .disabled(cardCount + offset < 1 || cardCount + offset > Emojis[emojiTheme].count)
    }
    
    var cardAdder: some View {
        cardCountAdjuster(by: 1, symbol: "rectangle.stack.badge.plus.fill")
    }
    
    var cardRemover: some View {
        cardCountAdjuster(by: -1, symbol: "rectangle.stack.badge.minus.fill")
    }
    
    func selectThemeButton (theme: String, symbol: String) -> some View {
        var selected: Int = 0
        switch theme {
            case "gestures" :
                selected = gestures
            case "faces" :
                selected = faces
            case "animals" :
                selected = animals
            default :
                selected = gestures
        }
        return Button(action: {
            //结构体是值类型，值改变时会重新渲染视图
            emojiTheme = selected
            cardCount = Emojis[emojiTheme].count
            Emojis[emojiTheme].shuffle()
        }, label: {
            Text(symbol)
        })
    }
    
    var themeButtons: some View {
        HStack {
            Text("Emojis Themes:")
            selectThemeButton(theme: "gestures", symbol: "gestures")
            selectThemeButton(theme: "faces", symbol: "faces")
            selectThemeButton(theme: "animals", symbol: "animals")
        }
        .padding()
    }
    
}


struct CardView: View{
    let content: String
    @State var isFaceUp: Bool = true
    
    var body: some View{
        ZStack{
            let base = RoundedRectangle(cornerRadius: 12)
            // Group: For each thing in '{}', do sth. (like .opacity(isFaceUp ? 1 : 0))
            Group{
                base.foregroundColor(Color(.white))
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)  // opacity: 不透明
            base.fill().opacity(isFaceUp ? 0 : 1)
            //如果isFaceUp为true，则Group的视图将完全不透明（opacity为1），而base.fill()将完全透明（opacity为0）；反之亦然。
        }
        .onTapGesture {
//            print("taped!")
            isFaceUp.toggle()
        }
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
