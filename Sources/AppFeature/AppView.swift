//
//  File.swift
//  
//
//  Created by Karthick Ramasamy on 12/03/22.
//

import SwiftUI
import HomeFeature
import NotificationsFeature
import ExploreFeature
import ProfileFeature

public enum Tab {
    case home
    case notifications
    case explore
    case profile
}

public struct AppView: View {
    @ObservedObject var viewModel: AppViewModel
    
    public init(viewModel: AppViewModel) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        TabView(selection: $viewModel.selectedTab) {
            HomeView().tabItem {
                Text("Home")
            }
            .tag(Tab.home)
            NotificationsView().tabItem {
                Text("Notifications")
            }
            .tag(Tab.notifications)
            ExploreView().tabItem {
                Text("Explore")
            }
            .tag(Tab.explore)
            ProfileView().tabItem {
                Text("Profile")
            }
            .tag(Tab.profile)
        }
    }
}
