//
//  PostData.swift
//  H4X0R
//
//  Created by Kwangjun Kim on 2022/06/01.
//

import Foundation

struct Result: Decodable {
    let hits: [Post]
}

struct Post: Decodable, Identifiable {
    var id: String {
        return objectID
    }
    let objectID: String
    let points: Int
    let title: String
    let url: String?
    
}
