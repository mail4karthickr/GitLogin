//
//  File.swift
//  
//
//  Created by Karthick Ramasamy on 08/10/22.
//

import Combine
import Environment
import Models

@MainActor
class RepositoriesViewModel: ObservableObject {
    @Published var route: Route?
    @Published var isLoading = false
    @Published var repositories: [Repository] = []
    
    enum Route {
        case error(String)
    }
    
    func fetchRepositories() {
        Task {
            self.isLoading = true
            do {
                let repositories = try await AppEnvironment.current.gitClient.repositories()
                self.repositories = repositories
            } catch {
                self.route = .error("Network error")
            }
            self.isLoading = false
        }
    }
}
