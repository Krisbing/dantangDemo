//
//  HBDetailViewController.swift
//  DanTang
//
//  Created by 贺兵 on 2017/5/12.
//  Copyright © 2017年 贺兵. All rights reserved.
//

import UIKit
import WebKit

class HBDetailViewController: HBBaseViewController {

    var homeItem:HBHomeItem?
    
    var detailWebView = WKWebView()
    
    var progress = UIProgressView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.setupWebView()
    }
    
    func setupWebView() {
      
        let config = WKWebViewConfiguration.init()
        config.userContentController = WKUserContentController.init()
        config.userContentController.add(self as WKScriptMessageHandler, name: "message")
        self.detailWebView = WKWebView.init(frame: self.view.bounds, configuration: config)
        self.detailWebView.navigationDelegate = self
        self.view.addSubview(self.detailWebView)
        self.detailWebView.addRefreshActivityView()
        self.detailWebView.load(NSURLRequest.init(url: NSURL.init(string: (homeItem?.content_url)!) as! URL) as URLRequest)
        
        self.progress = UIProgressView.init(frame: CGRect.init(x: 0, y: 65, width: SCREEN_WIDTH, height: 2))
        self.view.addSubview(self.progress)
        
        self.detailWebView.addObserver(self, forKeyPath: "estimatedProgress", options:.new, context: nil)
    }                                                                                                                                                                                                                                                  
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        if keyPath == "estimatedProgress" && (object != nil) {
            self.progress.alpha = 1.0
            self.progress.setProgress(Float(self.detailWebView.estimatedProgress), animated: true)
            if self.detailWebView.estimatedProgress >= 1.0 {
                
                UIView.animate(withDuration: 0.3, delay: 0.3, options: .curveEaseOut, animations: { 
                    
                    self.progress.alpha = 0
                    
                }, completion: { (finished) in
                    
                    self.progress.setProgress(0.0, animated: false)
                })
            }
        }
        else
        {
            super.observeValue(forKeyPath: keyPath, of: object, change: change, context: context)
        }
    }
    
    deinit {
       
        self.detailWebView.removeObserver(self, forKeyPath: "estimatedProgress")
    }
}
extension HBDetailViewController:WKNavigationDelegate,WKScriptMessageHandler {
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        
        let dict = message.body
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
        self.detailWebView.removeRefreshActivityView()
    }
    
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        
        self.detailWebView.removeRefreshActivityView()
    }
    
}
