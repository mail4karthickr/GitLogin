//
//  Environment.swift
//  GithubLogin
//
//  Created by Karthick Ramasamy on 25/02/22.
//

import Foundation
import GitClient
import GitClientLive

public protocol BundleType {
    func path(forResource name: String?, ofType ext: String?) -> String?
}

extension Bundle: BundleType {}

/**
 A collection of **all** global variables and singletons that the app wants access to.
 */
public struct Environment {
    /// A type that exposes endpoints for fetching github data.
    public let gitClient: GitClient

    public let state: String
    
    public let bundle: BundleType
    
    public init(
        gitClient: GitClient = .live(),
        state: String = UUID().uuidString,
        bundle: BundleType = Bundle.main
    ) {
        self.gitClient = gitClient
        self.state = state
        self.bundle = bundle
    }
}
