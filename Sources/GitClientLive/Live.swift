//
//  File.swift
//  
//
//  Created by Karthick Ramasamy on 10/10/22.
//

import Foundation
import GitClient
import Models

extension GitClient {
    private static let authorizationKey = "com.mail4karthickr.authorizationKey"
    private static let currentUserKey = "com.mail4karthickr.currentUserKey"
    
    public static func live() -> Self {
        var authorization = UserDefaults.standard.data(forKey: authorizationKey)
          .flatMap({ try? decoder.decode(Authorization.self, from: $0) })
        {
          didSet {
            UserDefaults.standard.set(
                authorization.flatMap { try? encoder.encode($0) },
              forKey: authorizationKey
            )
          }
        }
        
        var currentUser = UserDefaults.standard.data(forKey: currentUserKey)
            .flatMap({ try? decoder.decode(User.self, from: $0) })
        {
          didSet {
            UserDefaults.standard.set(
                currentUser.flatMap { try? encoder.encode($0) },
              forKey: currentUserKey
            )
          }
        }

        return GitClient(
            fetchAccessToken: {
                let currentAuthorization: Authorization = try await apiRequest(
                    AccessTokenReq(code: $0),
                    nil
                )
                authorization = currentAuthorization
                return currentAuthorization
            },
            currentAuthorization: { authorization },
            user: {
                let user: User = try await apiRequest(
                    UserReq(),
                    authorization?.accessToken
                )
                currentUser = user
                return user
            },
            currentUser: { currentUser },
            repositories: {
                guard let user = currentUser else {
                    throw ApiError.authenticationRequired
                }
                let repository: [Repository] = try await apiRequest(
                    RepositoryReq(org: user.login),
                    authorization?.accessToken
                )
                return repository
            }
        )
    }
}

private func apiRequest<T: Decodable>(_ request: Request, _ accessToken: String?) async throws -> T {
    guard let urlRequest = request.build(accessToken) else {
        throw ApiError.invalidRequest(request)
    }
    do {
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        if let response = response as? HTTPURLResponse,
                    !(200...299).contains(response.statusCode) {
            throw ApiError.serverError(statusCode: response.statusCode)
        }
        print("response data -- \(String(data: data, encoding: .utf8))")
        let model = try JSONDecoder().decode(T.self, from: data)
        return model
    } catch let error as DecodingError {
        throw ApiError.decodingError(error)
    } catch {
        throw ApiError.transportError(error)
    }
}

private let encoder = { () -> JSONEncoder in
  let encoder = JSONEncoder()
  encoder.dateEncodingStrategy = .secondsSince1970
  return encoder
}()

private let decoder = { () -> JSONDecoder in
  let decoder = JSONDecoder()
  decoder.dateDecodingStrategy = .secondsSince1970
  return decoder
}()
