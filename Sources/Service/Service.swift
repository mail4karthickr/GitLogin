//
//  Service.swift
//  GithubLogin
//
//  Created by Karthick Ramasamy on 25/02/22.
//

import Foundation
import Combine
import Models

public enum ServiceError: Error {
    case invalidRequest(GitHubRequest)
    case badServerResponse(URLResponse)
    case invalidData(Data)
}

public class GitHubService: ServiceType {
    private var cancellables = Set<AnyCancellable>()
    public init() {}

    public func fetchAccessToken(accessCode: String) -> AnyPublisher<Authorization, ServiceError> {
        return requestModel(.fetchAccessToken(code: accessCode))
    }

    public func requestModel<T: Decodable>(_ request: GitHubRequest) -> AnyPublisher<T, ServiceError> {
        return requestData(request)
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError { $0 as! ServiceError }
            .eraseToAnyPublisher()
    }

    public func requestJson(_ request: GitHubRequest) -> AnyPublisher<String, ServiceError> {
        return requestData(request)
            .tryMap {
                guard let responseStr = String(data: $0, encoding: .utf8) else {
                    throw ServiceError.invalidData($0)
                }
                return responseStr
            }.mapError {
                $0 as! ServiceError
            }
            .eraseToAnyPublisher()
    }
    
    public func requestData(_ request: GitHubRequest) -> AnyPublisher<Data, ServiceError> {
        guard let urlRequest = request.urlRequest else {
            return Fail(error: .invalidRequest(request)).eraseToAnyPublisher()
        }
        return URLSession.shared
            .dataTaskPublisher(for: urlRequest)
            .tryMap { element -> Data in
                guard let httpResponse = element.response as? HTTPURLResponse,
                      httpResponse.statusCode == 200 else {
                          throw ServiceError.badServerResponse(element.response)
                }
                return element.data
            }
            .mapError {
                $0 as! ServiceError
            }
            .eraseToAnyPublisher()
    }
}
