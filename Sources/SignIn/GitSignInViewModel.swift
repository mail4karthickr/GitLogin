//
//  GitHubSignInViewModel.swift
//  GithubLogin
//
//  Created by Karthick Ramasamy on 24/02/22.
//

import Foundation
import Combine
import SwiftUI
import SwiftUINavigation
import WebKit
import Models
import WebView
import GitClient

public class GitSignInViewModel: ObservableObject {
    
    enum Route {
        case signInWebView(WebViewModel)
    }
    
    @Published var route: Route?
    @Published var webViewModel: WebViewModel
    
    private var loginResponse: (LoginResponse) -> Void
    
    public init(
        webViewModel: WebViewModel = .init(),
        loginResponse: @escaping (LoginResponse) -> Void
    ) {
        self.webViewModel = webViewModel
        self.loginResponse = loginResponse
        webViewModel.decidePolicyFor = decidePolicyFor(_:navigationAction:decisionHandler:)
    }

    var authUrl: URL {
        let uuid = UUID().uuidString
        let url = "https://github.com/login/oauth/authorize?client_id=" + Constants.CLIENT_ID + "&scope=" + Constants.SCOPE + "&redirect_uri=" + Constants.REDIRECT_URI + "&state=" + uuid
        return URL(string: url)!
    }
    
    var authUrlRequest: URLRequest {
        return URLRequest(url: authUrl)
    }

    func onAppear() {
        WKWebView.clean()
        self.webViewModel.load(request: URLRequest(url: self.authUrl))
    }

    private func decidePolicyFor(
        _ webView: WKWebView,
        navigationAction: WKNavigationAction,
        decisionHandler: (WKNavigationActionPolicy) -> Void
    ) {
        guard let url = navigationAction.request.url?.absoluteString else {
            decisionHandler(.allow)
            return
        }
        let urlComponents = URLComponents(string: url)
        if let code = urlComponents?.queryItems?.first(where: { $0.name == "code" })?.value,
           let state = urlComponents?.queryItems?.first(where: { $0.name == "state" })?.value {
            loginResponse(.init(code: code, state: state))
        }
        decisionHandler(.allow)
    }
}
