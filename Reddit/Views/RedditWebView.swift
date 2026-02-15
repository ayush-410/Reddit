//
//  WebView.swift
//  Reddit
//
//  Created by Ayush Kumar Singh on 14/02/26.
//

import SwiftUI
import WebKit

struct RedditWebView: View {
    
    var webViewURL: URL
    
    var body: some View {
        WebView(url: webViewURL)
    }
}

#Preview {
    RedditWebView(webViewURL: URL(string: "https://www.reddit.com/")!)
}
