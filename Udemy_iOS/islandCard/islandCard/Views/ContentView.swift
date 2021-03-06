//
//  ContentView.swift
//  islandCard
//
//  Created by Kwangjun Kim on 2022/05/29.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 0.18, green: 0.80, blue: 0.44, opacity: 1.00)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Image("islandSumn")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 150, height: 150)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 5))
                    Text("dear_island.sumn")
                        .font(Font.custom("Pacifico-Regular", size: 40))
                        .bold()
                        .foregroundColor(.white)
                    Text("Artist")
                        .foregroundColor(.white)
                        .font(.system(size: 25))
                    Divider()
                    NavigationLink(destination: LikeView()) {
                        InfoView(text: "Tap", imageName: "suit.heart.fill")
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


