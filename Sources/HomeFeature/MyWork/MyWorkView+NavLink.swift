//
//  File.swift
//  
//
//  Created by Karthick Ramasamy on 09/10/22.
//

import SwiftUI
import CasePaths

extension MyWorkView {
    var issues: some View {
        NavigationLink(
            unwrapping: self.$viewModel.route,
            case: /MyWorkViewModel.Route.issues,
            destination: {
                IssuesView(viewModel: $0.wrappedValue)
            },
            onNavigate: { self.viewModel.setIssuesNavigation(isActive: $0) },
            label: {
                Text("Issues")
            }
        )
    }
    
    var pullRequests: some View {
        NavigationLink(
            unwrapping: self.$viewModel.route,
            case: /MyWorkViewModel.Route.pullRequests,
            destination: {
                PullRequestsView(viewModel: $0.wrappedValue)
            },
            onNavigate: self.viewModel.setPullRequestsNavigation(isActive:),
            label: {
                Text("PullRequests")
            }
        )
    }
    
    var repositories: some View {
        NavigationLink(
            unwrapping: self.$viewModel.route,
            case: /MyWorkViewModel.Route.repositories,
            destination: {
                RepositoriesView(viewModel: $0.wrappedValue)
            },
            onNavigate: self.viewModel.setRepositoriesNavigation(isActive:),
            label: {
                Text("Repositories")
            }
        )
    }
    
    var starred: some View {
        NavigationLink(
            unwrapping: self.$viewModel.route,
            case: /MyWorkViewModel.Route.starred,
            destination: {
                StarredView(viewModel: $0.wrappedValue)
            },
            onNavigate: self.viewModel.setStarredNavigation(isActive:),
            label: {
                Text("Starred")
            }
        )
    }
    
    var discussions: some View {
        NavigationLink(
            unwrapping: self.$viewModel.route,
            case: /MyWorkViewModel.Route.discussions,
            destination: {
                DiscussionsView(viewModel: $0.wrappedValue)
            },
            onNavigate: self.viewModel.setDiscussionsNavigation(isActive:),
            label: {
                Text("Discussions")
            }
        )
    }
    
    var organizations: some View {
        NavigationLink(
            unwrapping: self.$viewModel.route,
            case: /MyWorkViewModel.Route.organizations,
            destination: {
                OrganizationsView(viewModel: $0.wrappedValue)
            },
            onNavigate: self.viewModel.setOrganizationsNavigation(isActive:),
            label: {
                Text("Organizations")
            }
        )
    }
}
