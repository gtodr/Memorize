//
//  ContentView.swift
//  Memorize
//
//  Created by 徐德润 on 2023/6/20.
//

import SwiftUI

struct ContentView: View {
    
    let emojis: [String] = ["👏", "🤞", "🤌", "🫴", "👎", "🤚", "👇", "👏", "🤞", "🤌", "🫴", "👎", "🤚", "🖕"]
    @State var cardCount: Int = 4
    var body: some View {
        VStack {
            HStack {
                ForEach(0..<cardCount, id: \.self) {index in
                    CardView(content: emojis[index])
                }
            }
            .foregroundColor(.orange)
            .padding()
            HStack {
                Button("Add Card"){
                    cardCount += 1
                }
                Button("Delete Card"){
                    cardCount -= 1
                }
            }
        }
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
