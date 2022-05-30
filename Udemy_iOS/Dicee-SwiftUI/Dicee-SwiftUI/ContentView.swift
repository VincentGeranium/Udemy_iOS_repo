//
//  ContentView.swift
//  Dicee-SwiftUI
//
//  Created by Kwangjun Kim on 2022/05/30.
//

import SwiftUI

struct ContentView: View {
    
    @State var leftDiceNumber = 1
    @State var rightDiceNumber = 1
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image("diceeLogo")
                Spacer()
                HStack {
                    DiceView(n: leftDiceNumber)
                    DiceView(n: rightDiceNumber)
                }
                .padding(.horizontal)
                Spacer()
                Button(action: {
                    self.leftDiceNumber = Int.random(in: 1...6)
                    self.rightDiceNumber = Int.random(in: 1...6)
                }) {
                    Text("Roll")
                        .font(.system(size: 50))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.horizontal)
                }
                .background(Color.red)
            }
        }
    }
}

struct DiceView: View {
    
    let n: Int
    
    var body: some View {
        Image("dice\(n)")
            .resizable()
            .aspectRatio(1, contentMode: .fit)
            .padding()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



//struct ContentView: View {
//
//    @State var leftDiceNumber = 1
//    @State var rightDiceNumber = 1
//
//    var body: some View {
//        ZStack {
//            Image("background")
//                .resizable()
//                .edgesIgnoringSafeArea(.all)
//            VStack {
//                Image("diceeLogo")
//                Spacer()
//                HStack {
//                    DiceView(number: leftDiceNumber)
//                    DiceView(number: rightDiceNumber)
//                }
//                .padding(.horizontal)
//                Spacer()
//                Button(action: {
//                    self.leftDiceNumber = Int.random(in: 1...6)
//                    self.rightDiceNumber = Int.random(in: 1...6)
//                }) {
//                    Text("Roll")
//                        .font(.system(size: 50))
//                        .fontWeight(.heavy)
//                        .foregroundColor(.white)
//                        .padding(.horizontal)
//                }
//                .background(Color.red)
//            }
//        }
//    }
//}
//
//struct DiceView: View {
//
//    let number: Int
//
//    var body: some View {
//        Image("dice\(number)")
//            .resizable()
//            .aspectRatio(1, contentMode: .fit)
//            .padding()
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
//
//