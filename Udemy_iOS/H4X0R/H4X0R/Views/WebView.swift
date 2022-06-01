//
//  WebView.swift
//  H4X0R
//
//  Created by Kwangjun Kim on 2022/06/01.
//

import Foundation
import WebKit
import SwiftUI

// UIViewRepresentable -> allows us to create a swiftui view that represent a uikit view
struct WebView: UIViewRepresentable {
    
    let urlString: String?
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let safeString = urlString {
            if let url = URL(string: safeString) {
                let request = URLRequest(url: url)
                uiView.load(request)
            }
        }
    }
}

