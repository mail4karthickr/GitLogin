//
//  SignOnViewModel.swift
//  GithubLogin
//
//  Created by Karthick Ramasamy on 24/02/22.
//

import Foundation
import Combine
import SwiftUINavigation
import Environment
import Models
import GitClient

@MainActor
public class SignInViewModel: ObservableObject {
    @Published var route: Route?
    @Published var loading: Bool = false
    private var authorizationResult: ((Result<Authorization, Error>) -> Void)?
    private var cancellables: Set<AnyCancellable> = []
    
    public enum Route: Equatable {
        case signInWithGitHub(GitSignInViewModel)
        case signInWithGitHubEnterprise
        case safariView(URL)
        
        public static func == (lhs: Self, rhs: Self) -> Bool {
            switch (lhs, rhs) {
            case (.signInWithGitHub(let lhsVm), .signInWithGitHub(let rhsVm)):
                return lhsVm === rhsVm
            case (.signInWithGitHubEnterprise, .signInWithGitHubEnterprise):
                return true
            case (.safariView(let lhsUrl), .safariView(let rhsUrl)):
                return lhsUrl == rhsUrl
            default:
                return false
            }
        }
    }

    public init(
        route: Route? = nil,
        authorizationResult: ((Result<Authorization, Error>) -> Void)? = nil
    ) {
        self.route = route
        self.authorizationResult = authorizationResult
    }

    func termsOfUseTapped() {
        self.route = .safariView(AppConstants.termsOfUse)
    }
    
    func privacyPolicyTapped() {
        self.route = .safariView(AppConstants.privacyPolicy)
    }

    func signInWithGitHub() {
        self.route = .signInWithGitHub(
            .init(loginResponse: { loginResponse in
                Task {
                    await self.fetchAccessToken(loginResponse)
                }
            })
        )
    }

    func fetchAccessToken(_ response: LoginResponse) async {
//        self.route = nil
//        self.loading = true
//         AppEnvironment.current.apiService
//            .fetchAccessToken(accessCode: response.code)
//            .receive(on: DispatchQueue.main)
//            .sink(
//                receiveCompletion: { compl in
//                    self.loading = false
//                },
//                receiveValue: { (value: Authorization) in
//                    print("authorization -- \(value)")
//                    self.route = .tabView(value)
//                }
//            )
//            .store(in: &self.cancellables)
//        self.route = nil
        self.loading = true
        do {
           let authorization = try await AppEnvironment.current.gitClient.fetchAccessToken(response.code)
            let user = try await AppEnvironment.current.gitClient.user()
            print("User -- \(user)")
            self.authorizationResult?(.success(authorization))
        } catch {
            print("FetchError -- \(error)")
        }
        self.loading = false
    }
}
