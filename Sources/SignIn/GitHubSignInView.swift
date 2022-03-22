//
//  GitHubSignInView.swift
//  GithubLogin
//
//  Created by Karthick Ramasamy on 24/02/22.
//

import SwiftUI
import WebView

public struct GitHubSignInView: View {
    @ObservedObject var viewModel: GitHubSignInViewModel
    @Environment(\.presentationMode) private var presentationMode

    public var body: some View {
        NavigationView {
            WebView(viewModel: viewModel.webViewModel)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: { presentationMode.wrappedValue.dismiss() }) {
                        Text("cancel")
                    }
                }
            }
            .onAppear {
                viewModel.onAppear()
            }
        }
    }
}
