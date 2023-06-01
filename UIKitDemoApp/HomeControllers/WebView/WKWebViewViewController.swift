//
//  WKWebViewViewController.swift
//  UIKitDemoApp
//
//  Created by ROBIN.J.Y.ZHONG on 2023/5/23.
//

import UIKit
import WebKit
import SnapKit

class WKWebViewViewController: BaseViewController {

    var wkWebView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "WKWebView-网页视图"
        
        setupViews()
    }
    
    func setupViews(){
        wkWebView = WKWebView()
        view.addSubview(wkWebView)
        wkWebView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        // 加载网页
        // https://www.toutiao.com/， 这个url 已经适配了ios的webview 刘海屏
        // https://cn.bing.com/, 这个url不会占满全屏，ios 的webview 刘海屏适配方案优选h5解决
        // 在需要适配iphone X的头部添加一行代码，这也是苹果官方提供的适配iphoneX的方式。
        // <meta name="viewport" content="viewport-fit=cover" />
        let url = URL(string: "https://www.toutiao.com/")
        let request: URLRequest = URLRequest(url: url!)
        wkWebView.load(request)
        
        // 设置代理
        wkWebView.navigationDelegate = self
        wkWebView.uiDelegate = self
    }

}

extension WKWebViewViewController : WKNavigationDelegate {
    func webView(_ webView: WKWebView, navigationAction: WKNavigationAction, didBecome download: WKDownload) {
        print("webView navigationAction did become download")
    }
    
    // 打印出所有请求的URL
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        let url = navigationAction.request.url
        print("URL = ", url)
        print("scheme = ", url?.scheme)
        
        // 让navigation继续执行
        decisionHandler(WKNavigationActionPolicy.allow)
    }
}

extension WKWebViewViewController: WKUIDelegate {
    
    func webViewDidClose(_ webView: WKWebView) {
        print("webViewDidClose invoked")
    }

    func webView(_ webView: WKWebView, contextMenuDidEndForElement elementInfo: WKContextMenuElementInfo) {
        print("webView contextMenuDidEndForElement invoked")
    }
    
    func webView(_ webView: WKWebView, willDismissEditMenuWithAnimator animator: UIEditMenuInteractionAnimating) {
        print("webView willDismissEditMenuWithAnimator invoked")
    }
    
    func webView(_ webView: WKWebView, willPresentEditMenuWithAnimator animator: UIEditMenuInteractionAnimating) {
        print("webView willPresentEditMenuWithAnimator invoked")
    }
    
    func webView(_ webView: WKWebView, contextMenuWillPresentForElement elementInfo: WKContextMenuElementInfo) {
        print("webView contextMenuWillPresentForElement invoked")
    }
    
//    func webView(_ webView: WKWebView, showLockdownModeFirstUseMessage message: String) async -> WKDialogResult {
//        print("webView showLockdownModeFirstUseMessage invoked")
//    }
//    func webView(_ webView: WKWebView, showLockdownModeFirstUseMessage message: String, completionHandler: @escaping (WKDialogResult) -> Void) {
//    }
    
//    func webView(_ webView: WKWebView, contextMenuConfigurationFor elementInfo: WKContextMenuElementInfo) async -> UIContextMenuConfiguration? {
//        print("webView contextMenuConfigurationFor invoked")
//        return nil
//    }
//    func webView(_ webView: WKWebView, contextMenuConfigurationForElement elementInfo: WKContextMenuElementInfo, completionHandler: @escaping (UIContextMenuConfiguration?) -> Void) {
//    }
    
//    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
//        print("webView createWebViewWith configuration for navigationAction,windowFeatures invoked")
//        return nil
//    }
    
    func webView(_ webView: WKWebView, contextMenuForElement elementInfo: WKContextMenuElementInfo, willCommitWithAnimator animator: UIContextMenuInteractionCommitAnimating) {
        print("webView contextMenuForElement willCommitWithAnimator invoked")
    }
    
    
//    func webView(_ webView: WKWebView, decideMediaCapturePermissionsFor origin: WKSecurityOrigin, initiatedBy frame: WKFrameInfo, type: WKMediaCaptureType) async -> WKPermissionDecision {
//        print("webView decideMediaCapturePermissionsFor initiatedBy frame invoked")
//    }
    
//    func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo) async {
//    }
//    func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void) {
//    }
    
//    func webView(_ webView: WKWebView, runJavaScriptConfirmPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo) async -> Bool {
//    }
//    func webView(_ webView: WKWebView, runJavaScriptConfirmPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (Bool) -> Void) {
//    }
    
//    func webView(_ webView: WKWebView, runJavaScriptTextInputPanelWithPrompt prompt: String, defaultText: String?, initiatedByFrame frame: WKFrameInfo) async -> String? {
//    }
//    func webView(_ webView: WKWebView, runJavaScriptTextInputPanelWithPrompt prompt: String, defaultText: String?, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (String?) -> Void) {
//    }
    
//    func webView(_ webView: WKWebView, requestMediaCapturePermissionFor origin: WKSecurityOrigin, initiatedByFrame frame: WKFrameInfo, type: WKMediaCaptureType, decisionHandler: @escaping (WKPermissionDecision) -> Void) {
//    }
    
//    func webView(_ webView: WKWebView, requestDeviceOrientationAndMotionPermissionFor origin: WKSecurityOrigin, initiatedByFrame frame: WKFrameInfo, decisionHandler: @escaping (WKPermissionDecision) -> Void) {
//
//    }
    
    
//    func webView(_ webView: WKWebView, shouldPreviewElement elementInfo: WKPreviewElementInfo) -> Bool {
//    }
//
//    func webView(_ webView: WKWebView, commitPreviewingViewController previewingViewController: UIViewController) {
//    }
//
//    func webView(_ webView: WKWebView, previewingViewControllerForElement elementInfo: WKPreviewElementInfo, defaultActions previewActions: [WKPreviewActionItem]) -> UIViewController? {
//    }
}
