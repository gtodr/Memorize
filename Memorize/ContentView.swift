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
    @State var isFaceUp: Bool = false
    var body: some View{
        ZStack{
            let base = RoundedRectangle(cornerRadius: 12)
            if isFaceUp{
                base.foregroundColor(Color(.white))
                base.strokeBorder(lineWidth: 2)
                Text("👅").font(.largeTitle)
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
