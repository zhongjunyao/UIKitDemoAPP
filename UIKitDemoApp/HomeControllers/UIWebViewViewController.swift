//
//  UIWebViewViewController.swift
//  UIKitDemoApp
//
//  Created by ROBIN.J.Y.ZHONG on 2023/5/23.
//

import UIKit
import SnapKit


class UIWebViewViewController: BaseViewController {
    
    var webView: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "UIWebView-网页视图"
        
        setupViews()
    }
    
    func setupViews(){
        webView = UIWebView(frame: view.frame)
        view.addSubview(webView)
        
        // 加载网页
        let request: URLRequest = URLRequest(url: URL(filePath: "http://192.168.0.106:8001/resource/baidu.html"))
        webView.loadRequest(request)
        
        // 设置代理
        webView.delegate = self
    }
}

extension UIWebViewViewController: UIWebViewDelegate {
    
    // 即将开始网页加载时，回调
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebView.NavigationType) -> Bool {
        print("webView shouldStartLoadWith request invoked, navigationType: ", navigationType)
        return true
    }
    
    // 已经开始网页加载时，回调
    func webViewDidStartLoad(_ webView: UIWebView) {
        print("webViewDidStartLoad invoked")
    }
    
    // 网页加载已经成功完成时，回调
    func webViewDidFinishLoad(_ webView: UIWebView) {
        print("webViewDidFinishLoad invoked")
    }
    
    // 网页加载已经失败时，回调
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        print("webView didFailLoadWithError invoked, error: ", error)
    }
    
    
}
