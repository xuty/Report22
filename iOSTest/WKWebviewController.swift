//
//  Untitled.swift
//  iOSTest
//
//  Created by Z on 2024/11/5.
//
import Foundation
import UIKit
import WebKit
import AVFoundation

@objc(WKWebviewController)
public class WKWebviewController : UIViewController, WKUIDelegate {
    var webview : WKWebView! = nil
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        let wkConfig = WKWebViewConfiguration()
        wkConfig.ignoresViewportScaleLimits = false
        wkConfig.allowsInlineMediaPlayback = true
        wkConfig.mediaTypesRequiringUserActionForPlayback = []
        if #available(iOS 17.0, *) {
            wkConfig.allowsInlinePredictions = true
        } else {
            // Fallback on earlier versions
        }
        self.webview = WKWebView(frame: self.view.bounds, configuration: wkConfig)
        self.webview.uiDelegate = self
        let htmlPath = URL(fileURLWithPath: Bundle.main.path(forResource: "test", ofType: "html")!)
        if #available(iOS 16.4, *) {
            self.webview.isInspectable = true
        } else {
            // Fallback on earlier versions
        }
        
        let status = AVCaptureDevice.authorizationStatus(for: .video)
        if status != .authorized  {
            AVCaptureDevice.requestAccess(for: .video) { it in
                DispatchQueue.main.async{
                    self.webview.load(URLRequest(url: htmlPath))
                }
            }
        } else {
            self.webview.load(URLRequest(url: htmlPath))
                    
        }
        self.view.addSubview(self.webview)
    }

    @available(iOS 15.0, *)
    public func webView(_ webView: WKWebView, requestMediaCapturePermissionFor origin: WKSecurityOrigin, initiatedByFrame frame: WKFrameInfo, type: WKMediaCaptureType, decisionHandler: @escaping @MainActor @Sendable (WKPermissionDecision) -> Void) {
        decisionHandler(.grant)
    }
    
    /** @abstract A delegate to request permission for microphone audio and camera video access.
     @param webView The web view invoking the delegate method.
     @param origin The origin of the page.
     @param frame Information about the frame whose JavaScript initiated this call.
     @param type The type of capture (camera, microphone).
     @param decisionHandler The completion handler to call once the decision is made
     @discussion If not implemented, the result is the same as calling the decisionHandler with WKPermissionDecisionPrompt.
     */
//    @available(iOS 15.0, *)
//    @available(iOS 15.0, *)
//    public func webView(_ webView: WKWebView, decideMediaCapturePermissionsFor origin: WKSecurityOrigin, initiatedBy frame: WKFrameInfo, type: WKMediaCaptureType) async -> WKPermissionDecision {
//        print("webview")
//        return .grant
//    }

    
    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
}

