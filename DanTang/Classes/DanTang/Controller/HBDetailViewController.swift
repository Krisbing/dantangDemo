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
