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
import Service

public class SignInViewModel: ObservableObject {
    @Published var route: Route?
    @Published var loading: Bool = false
    private var cancellables: Set<AnyCancellable> = []
    
    public enum Route: Equatable {
        case signInWithGitHub(GitHubSignInViewModel)
        case signInWithGitHubEnterprise
        case safariView(URL)
        case rootView(Authorization)
        
        public static func == (lhs: Self, rhs: Self) -> Bool {
            switch (lhs, rhs) {
            case (.signInWithGitHub(let lhsVm), .signInWithGitHub(let rhsVm)):
                return lhsVm === rhsVm
            case (.signInWithGitHubEnterprise, .signInWithGitHubEnterprise):
                return true
            case (.safariView(let lhsUrl), .safariView(let rhsUrl)):
                return lhsUrl == rhsUrl
            case (.rootView(let lhsValue), .rootView(let rhsValue)):
                return lhsValue == rhsValue
            default:
                return false
            }
        }
    }

    public init(route: Route? = nil) {
        self.route = route
    }

    func termsOfUseTapped() {
        self.route = .safariView(AppConstants.termsOfUse)
    }
    
    func privacyPolicyTapped() {
        self.route = .safariView(AppConstants.privacyPolicy)
    }

    func signInWithGitHub() {
        self.route = .signInWithGitHub(
            .init(loginResponse: fetchAccessToken(_:))
        )
    }

    func fetchAccessToken(_ response: LoginResponse) {
        self.route = nil
        self.loading = true
         AppEnvironment.current.apiService
            .fetchAccessToken(accessCode: response.code)
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { compl in
                    self.loading = false
                },
                receiveValue: { (value: Authorization) in
                    print("authorization -- \(value)")
                    self.route = .rootView(value)
                }
            )
            .store(in: &self.cancellables)
    }
}
