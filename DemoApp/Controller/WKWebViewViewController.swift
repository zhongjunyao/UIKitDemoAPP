//
//  WKWebViewViewController.swift
//  DemoApp
//
//  Created by ROBIN.J.Y.ZHONG on 2023/5/23.
//

import UIKit
import WebKit

class WKWebViewViewController: BaseViewController {

    var wkWebView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "WKWebView-网页视图"
        
        setupViews()
    }
    
    func setupViews(){
        wkWebView = WKWebView(frame: view.frame)
        view.addSubview(wkWebView)
        
        // 加载网页
        let request: URLRequest = URLRequest(url: URL(filePath: "http://www.toutiao.com"))
        wkWebView.load(request)
        
        // 设置代理
        wkWebView.uiDelegate = self
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
