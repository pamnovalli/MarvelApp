//
//  HeroViewController.swift
//  MarvelApp
//
//  Created by Pamela Ianovalli on 06/06/19.
//  Copyright © 2019 Pamela Ianovalli. All rights reserved.
//

import UIKit
import WebKit

class HeroViewController: UIViewController{
    
    @IBOutlet weak var loading: UIActivityIndicatorView!
    @IBOutlet weak var webView: WKWebView!

    var hero: Hero!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: hero.urls.first!.url)
        let request = URLRequest(url: url!)
        title = hero.name
        
        webView.allowsBackForwardNavigationGestures = true
        webView.navigationDelegate = self as? WKNavigationDelegate
        webView.load(request)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension HeroViewController: WKUIDelegate {
    
    func webViewDidClose(_ webView: WKWebView) {
        loading.stopAnimating()
    }
    
}
