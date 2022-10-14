//
//  AppFeaturePreviewApp.swift
//  AppFeaturePreview
//
//  Created by Karthick Ramasamy on 22/09/22.
//

import SwiftUI
import AppFeature

@main
struct AppFeaturePreviewApp: App {
    var body: some Scene {
        WindowGroup {
            AppView(
                viewModel: AppViewModel(selectedTab: .notifications, authorization: .init(accessToken: "", scope: "", tokenType: ""))
            )
        }
    }
}
