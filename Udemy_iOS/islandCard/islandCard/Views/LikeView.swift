//
//  LikeView.swift
//  islandCard
//
//  Created by Kwangjun Kim on 2022/06/01.
//

import SwiftUI

struct LikeView: View {
    var body: some View {
        ZStack {
            Color(red: 0.18, green: 0.80, blue: 0.44, opacity: 1.00)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image("Like")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 5))
                Text("Like you")
                    .font(Font.custom("Pacifico-Regular", size: 40))
                    .bold()
                    .foregroundColor(.white)
                Text("From Minsung 😝")
                    .foregroundColor(.white)
                    .font(.system(size: 25))
                Divider()
                
                InfoView(text: "+25 01 3952 2228", imageName: "suit.heart.fill")
                InfoView(text: "Like you", imageName: "suit.heart.fill")
            }
        }
    }
}

struct LikeView_Previews: PreviewProvider {
    static var previews: some View {
        LikeView()
    }
}
