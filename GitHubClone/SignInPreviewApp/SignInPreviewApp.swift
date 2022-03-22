//
//  SignInPreviewAppApp.swift
//  SignInPreviewApp
//
//  Created by Karthick Ramasamy on 02/03/22.
//

import SwiftUI
import SignIn

@main
struct SignInPreviewApp: App {
    var body: some Scene {
        WindowGroup {
            SignInView(viewModel: .init())
        }
    }
}
