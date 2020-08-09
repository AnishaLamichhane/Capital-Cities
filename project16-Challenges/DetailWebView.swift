//
//  DetailWebView.swift
//  project16
//
//  Created by Anisha Lamichhane on 8/9/20.
//  Copyright © 2020 Anisha Lamichhane. All rights reserved.
//
import WebKit
import UIKit

class DetailWebView: UIViewController {
    @IBOutlet var webView: WKWebView!
    var url: String!
    
    override func loadView() {
        webView = WKWebView()
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

       showWebView()
        
    }
    

    func showWebView() {
        let finalUrl: URL!
        switch url {
        case "Oslo":
            finalUrl = URL(string: "https://en.wikipedia.org/wiki/Oslo")
        case "London":
            finalUrl = URL(string: "https://en.wikipedia.org/wiki/London")
        
        case "Washington":
            finalUrl = URL(string: "https://en.wikipedia.org/wiki/Washington")
        case "Kathmandu":
            finalUrl = URL(string: "https://en.wikipedia.org/wiki/Kathmandu")
        case "Paris":
            finalUrl = URL(string: "https://en.wikipedia.org/wiki/Paris")
        default:
            finalUrl = URL(string: "https://ru.wikipedia.org/wiki/")
        }
        webView.load(URLRequest(url: finalUrl!))
        webView.allowsBackForwardNavigationGestures = true
    }

}
