//
//  File.swift
//  
//
//  Created by Karthick Ramasamy on 12/10/22.
//

import Foundation

public enum Method: String {
    case get = "GET"
    case post = "POST"
}

public protocol Request {
    var httpMethod: Method { get }
    var path: String { get }
    var params: [String: String] { get }
    var headers: [String: String] { get }
    var baseUrl: String { get }
    func build(_ accessToken: String?) -> URLRequest?
}

extension Request {
    public var httpMethod: Method { .get }
    public var params: [String: String] { [:] }
    public var headers: [String: String] { ["Accept": "application/vnd.github+json"] }
    public var baseUrl: String { "https://api.github.com" }
    
    public func build(_ accessToken: String? = nil) -> URLRequest? {
        guard let url = URL(string: baseUrl + path) else {
            return nil
        }
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        let queryItems = self.params.map { URLQueryItem(name: $0, value: "\($1)") }
        components?.queryItems = queryItems
        guard let url = components?.url else {
            return nil
        }
        var request = URLRequest(url: url)
        request.httpMethod = self.httpMethod.rawValue
        var headers = self.headers
        if let accessToken = accessToken {
            headers.merge(["Authorization": "Bearer \(accessToken)"],
                          uniquingKeysWith: {_ , last in last })
        }
        request.allHTTPHeaderFields = headers
        print("Request -- \(request)")
        return request
    }
}
