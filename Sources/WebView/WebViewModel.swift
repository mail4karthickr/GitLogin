//
//  WebViewModel.swift
//  GithubLogin
//
//  Created by Karthick Ramasamy on 25/02/22.
//

import Foundation
import WebKit
import Combine

public class WebViewModel: NSObject, ObservableObject, WKNavigationDelegate {
    
    enum Event {
        case loadRequest(URLRequest)
    }

    public typealias DecidePolicyFor = (
        WKWebView,
        WKNavigationAction,
        (WKNavigationActionPolicy) -> Void
    ) -> Void

    @Published var event: Event?
    public var decidePolicyFor: DecidePolicyFor?

    public func load(request: URLRequest) {
        self.event = .loadRequest(request)
    }
    
    public func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        decidePolicyFor?(webView, navigationAction, decisionHandler)
    }
}
