//
//  File.swift
//  
//
//  Created by Karthick Ramasamy on 12/03/22.
//

import Foundation
import Service
import Combine
import Models
import Helpers

class MockService: ServiceType {
    public let fetchAccessTokenResponse: Authorization?
    public let fetchAccessTokenError: ServiceError?
    
    public init(
        fetchAccessTokenResponse: Authorization? = nil,
        fetchAccessTokenError: ServiceError? = nil
    ) {
        self.fetchAccessTokenResponse = fetchAccessTokenResponse
        self.fetchAccessTokenError = fetchAccessTokenError
    }
    
    public func fetchAccessToken(accessCode: String) -> AnyPublisher<Authorization, ServiceError> {
        if let error = self.fetchAccessTokenError {
            return Fail(error: error).eraseToAnyPublisher()
        } else if let response = fetchAccessTokenResponse {
            return .init(response)
        } else {
            return Empty().eraseToAnyPublisher()
        }
    }
}
