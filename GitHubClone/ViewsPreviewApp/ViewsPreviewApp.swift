//
//  ViewsPreviewAppApp.swift
//  ViewsPreviewApp
//
//  Created by Karthick Ramasamy on 27/02/22.
//

import SwiftUI
import Views

@main
struct ViewsPreviewApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}


struct ContentView: View {
    @State private var change: Bool? = nil
    @State private var isLoading = true
    
    var body: some View {
        LoaderButton(
            isLoading: isLoading,
            title: "title",
            action: { self.isLoading = false }
        )
    }
}

struct TrView: View {
    @Binding var show: Bool
    let dismiss: () -> Void

    var body: some View {
        Text("TrView")
            .onTapGesture {
                dismiss()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.green)
    }
}
