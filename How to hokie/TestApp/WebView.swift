//
//  WebView.swift
//  Countries
//
//  Created by Alex Cann on 9/17/19.
//  Copyright © 2019 Alex Cann. All rights reserved.
//

import SwiftUI
import WebKit
 
struct WebView: UIViewRepresentable {
   
    // Input Parameter
    let showURL: String
   
    // Used as e.g., WebView(showURL: "https://www.apple.com")
   
    func makeUIView(context: Context) -> WKWebView  {
        WKWebView(frame: .zero)
    }
 
    // A WKWebView object displays interactive web content in a web browser within the app
    func updateUIView(_ webView: WKWebView, context: Context) {
       
        // Convert the showURL string value into a URL struct
        let urlStruct = URL(string: showURL)
       
        /*
         Convert the URL struct into a URLRequest struct.
         URLRequest is a URL load request that is independent of protocol or URL scheme.
         */
        let urlLoadRequest = URLRequest(url: urlStruct!)
       
        // Ask the webView object to display the web page for the given URL
        webView.load(urlLoadRequest)
    }
 
}
 
 
struct WebView_Previews: PreviewProvider {
    static var previews: some View {
        WebView(showURL: "https://www.apple.com")
    }
}
 
 
