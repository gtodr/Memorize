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
//            Text("💋").font(.title)
//        }
//        .foregroundColor(.orange)
//        .imageScale(.small)
//        .padding()
        
        HStack {
            CardView()
            CardView(isFaceUp: true)
            CardView()
            CardView()
        }
        .foregroundColor(.orange)
        .padding()

    }
}


struct CardView: View{
    var isFaceUp: Bool = false
    var body: some View{
        ZStack(content: {
            if isFaceUp{
                RoundedRectangle(cornerRadius: 12).foregroundColor(Color(.white))
                RoundedRectangle(cornerRadius: 12).strokeBorder(lineWidth: 2)
            }else {
                RoundedRectangle(cornerRadius: 12)
            }
        })
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}