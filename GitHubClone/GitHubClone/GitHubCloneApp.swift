//
//  GitHubCloneApp.swift
//  GitHubClone
//
//  Created by Karthick Ramasamy on 26/02/22.
//

import SwiftUI
import SignIn

@main
struct GitHubCloneApp: App {
    var body: some Scene {
        WindowGroup {
            SignInView(viewModel: .init())
                .onOpenURL { url in
                    print("OnOpenURL -- \(url)")
                }
        }
    }
}
