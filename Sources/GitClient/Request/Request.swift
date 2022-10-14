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
    var request: URLRequest? { get }
}

extension Request {
    var baseUrl: String { "https://github.com" }
    
    var headers: [String: String] {
        ["Accept": "application/json"]
    }
    
    var get: String { "GET" }
    var post: String { "POST" }
    
    func url(_ path: String) -> URL? {
       return URL(string: baseUrl + path)
    }
    
    func queryItems(_ items: [String: String]) -> [URLQueryItem] {
        items.map { URLQueryItem(name: $0, value: "\($1)") }
    }
}
