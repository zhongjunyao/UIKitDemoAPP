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
        webView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        // 加载网页
        // https://www.toutiao.com/， 这个url 已经适配了ios的webview 刘海屏
        // https://cn.bing.com/, 这个url不会占满全屏，ios 的webview 刘海屏适配方案优选h5解决
        // 在需要适配iphone X的头部添加一行代码，这也是苹果官方提供的适配iphoneX的方式。
        // <meta name="viewport" content="viewport-fit=cover" />
        let url = URL(string: "https://cn.bing.com/")
        let request: URLRequest = URLRequest(url: url!)
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
