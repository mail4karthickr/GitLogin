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
            RootView(viewModel: .init())
        }
    }
}
