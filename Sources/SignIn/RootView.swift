//
//  File.swift
//  
//
//  Created by Karthick Ramasamy on 12/10/22.
//

import SwiftUI
import Models
import AppFeature
import Environment

public struct RootView: View {
    @ObservedObject var viewModel: RootViewModel

    public init(viewModel: RootViewModel) {
        self.viewModel = viewModel
    }

    public var body: some View {
        Group {
            if let route = viewModel.route {
                switch route {
                case .signInView(let viewModel):
                    SignInView(viewModel: viewModel)
                case .appView(let viewModel):
                    AppView(viewModel: viewModel)
                }
            }
        }
        .onAppear {
            viewModel.onAppear()
        }
    }
}

@MainActor
public class RootViewModel: ObservableObject {
    
    public enum Route {
        case signInView(SignInViewModel)
        case appView(AppViewModel)
    }

    @Published var route: Route?
    
    public init(route: Route? = nil) {
        self.route = route
    }
    
    func onAppear() {
        let signInViewModel = SignInViewModel(authorizationResult: {
            self.authorizationResult(result: $0)
        })
        guard let authorization = AppEnvironment.current.gitClient.currentAuthorization() else {
            self.route = .signInView(signInViewModel)
            return
        }
        self.route = .appView(.init(authorization: authorization))
    }
    
    func authorizationResult(result: Result<Authorization, Error>) {
        switch result {
        case .success(let authorization):
            self.route = .appView(.init(authorization: authorization))
        case .failure(let error):
            print("SignOnError")
        }
    }
}
