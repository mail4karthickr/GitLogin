//
//  ServiceType.swift
//  GithubLogin
//
//  Created by Karthick Ramasamy on 25/02/22.
//

import Foundation
import Combine
import Models

public protocol ServiceType {
    func fetchAccessToken(accessCode: String) -> AnyPublisher<Authorization, ServiceError>
}
