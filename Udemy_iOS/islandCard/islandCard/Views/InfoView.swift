//
//  InfoView.swift
//  islandCard
//
//  Created by Kwangjun Kim on 2022/05/29.
//

import SwiftUI

struct InfoView: View {
    
    let text: String
    let imageName: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(Color.white)
            .frame(height: 50)
            .overlay(
                HStack {
                    Image(systemName: imageName)
                        .foregroundColor(Color.green)
                    Text(text)
                        .foregroundColor(Color.init("InfoColor"))
                })
            .padding(.all)
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(text: "hello", imageName: "phone.fill")
        //previewLayout : is going to render our preview to fit the size of our component
            .previewLayout(.sizeThatFits)
    }
}
