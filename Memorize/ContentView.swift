//
//  ContentView.swift
//  Memorize
//
//  Created by 徐德润 on 2023/6/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        
//        ZStack {
//            RoundedRectangle(cornerRadius: 20)
//                .strokeBorder(style: StrokeStyle(lineWidth: 5, dash: [10,2]))
//            Text("👋").font(.title)
//        }
//        .foregroundColor(.orange)
//        .imageScale(.small)
//        .padding()
        
        let emojis: [String] = ["👏", "🤞", "🤌", "🫴"]
        HStack {
            ForEach(emojis.indices, id: \.self) {index in
                CardView(content: emojis[index])
            }
        }
        .foregroundColor(.orange)
        .padding()

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
