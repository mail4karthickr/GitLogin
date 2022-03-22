//
//  GitHubRequest.swift
//  GithubLogin
//
//  Created by Karthick Ramasamy on 26/02/22.
//

import Foundation

enum Method: String {
    case get = "GET"
    case post = "POST"
}

public enum GitHubRequest {
    case fetchAccessToken(code: String)
    
    var path: String {
        switch self {
        case .fetchAccessToken:
            return "/login/oauth/access_token"
        }
    }

    var url: URL? {
        switch self {
        case .fetchAccessToken:
            guard let url = URL(string: "https://github.com" + path) else {
                return nil
            }
            if httpMethod == .get {
                var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
                components?.queryItems = queryItems
                return components?.url
            } else {
                return url
            }
        }
    }
    
    var defaultParams: [String: String] {
        return ["client_id": Constants.CLIENT_ID, "client_secret": Constants.CLIENT_SECRET]
    }
        
    var params: [String: String] {
        var _params = [String: String]()
        switch self {
        case .fetchAccessToken(let code):
            _params = ["code": code]
        }
        return _params.merging(defaultParams) { $1 }
    }
    
    var body: Data? {
        guard httpMethod != .get, let httpBody = try? JSONEncoder().encode(params) else {
            return nil
        }
        return httpBody
    }
    
    var urlRequest: URLRequest? {
        guard let url = url else { return nil }
        if httpMethod == .get {
            var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
            components?.queryItems = queryItems
            guard let url = components?.url else {
                return nil
            }
            var request = URLRequest(url: url)
            request.httpMethod = httpMethod.rawValue
            request.allHTTPHeaderFields = headers
            return request
        } else {
            var request = URLRequest(url: url)
            request.httpMethod = httpMethod.rawValue
            request.httpBody = body
            request.allHTTPHeaderFields = headers
            return request
        }
    }
    
    var headers: [String: String] {
        ["Accept": "application/json"]
    }
    
    var httpMethod: Method {
        switch self {
        case .fetchAccessToken:
            return .get
        }
    }

    var queryItems: [URLQueryItem] {
        return params.map { URLQueryItem(name: $0, value: "\($1)") }
    }
}
