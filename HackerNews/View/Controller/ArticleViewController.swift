//
//  ArticleViewController.swift
//  HackerNews
//
//  Created by Varshith Chilamkurthi on 25/06/24.
//

import UIKit
import WebKit

class ArticleViewController: UIViewController {

    @IBOutlet var articleWKWebView: WKWebView!
    
    var url: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadArticle(url: url)
    }
    
    func loadArticle(url: String) {
        if let url = URL(string: url) {
            let request = URLRequest(url: url)
            articleWKWebView.load(request)
        }
    }
}
