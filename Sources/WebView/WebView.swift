//
//  ContentView.swift
//  GithubLogin
//
//  Created by Karthick Ramasamy on 24/02/22.
//

import SwiftUI
import WebKit

public struct WebView: UIViewRepresentable {
    @ObservedObject var viewModel: WebViewModel

    public init(viewModel: WebViewModel) {
        self.viewModel = viewModel
    }

    public func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = viewModel
        return webView
    }
    
    public func updateUIView(_ webView: WKWebView, context: Context) {
        switch viewModel.event {
        case .loadRequest(let request):
            webView.load(request)
        default:
            print("Unknown webview event")
        }
    }
}


extension WKWebView {
    public class func clean() {
        guard #available(iOS 9.0, *) else {return}

        HTTPCookieStorage.shared.removeCookies(since: Date.distantPast)

        WKWebsiteDataStore.default().fetchDataRecords(ofTypes: WKWebsiteDataStore.allWebsiteDataTypes()) { records in
            records.forEach { record in
                WKWebsiteDataStore.default().removeData(ofTypes: record.dataTypes, for: [record], completionHandler: {})
                #if DEBUG
                    print("WKWebsiteDataStore record deleted:", record)
                #endif
            }
        }
    }
}
