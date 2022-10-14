//
//  File 2.swift
//  
//
//  Created by Karthick Ramasamy on 09/10/22.
//

import Foundation
import Models

public struct GitClient {
    public var fetchAccessToken: (String) async throws -> Authorization
    public var currentAuthorization: () -> Authorization?
    public var user: () async throws -> User
    public var currentUser: () async throws -> User?
    public var repositories: () async throws -> [Repository]
    
    public init(
        fetchAccessToken: @escaping (String) async throws -> Authorization,
        currentAuthorization: @escaping () -> Authorization?,
        user: @escaping () async throws -> User,
        currentUser: @escaping () async throws -> User?,
        repositories: @escaping () async throws -> [Repository]
    ) {
        self.fetchAccessToken = fetchAccessToken
        self.currentAuthorization = currentAuthorization
        self.user = user
        self.currentUser = currentUser
        self.repositories = repositories
    }
}
