//
//  File.swift
//  
//
//  Created by Karthick Ramasamy on 12/10/22.
//

import Foundation

public struct AccessTokenReq: Request {
    private let clientId = "71e367625b34650a6bf1"
    private let secret = "d0941336c560b0191ea32c4a1075cf5789da1a4c"
    
    private let code: String
    public init(code: String) {
        self.code = code
    }

    public var path: String { "/login/oauth/access_token" }
    public var baseUrl: String { "https://github.com" }

    public var params: [String: String] { [
        "client_id": clientId,
        "client_secret": secret,
        "code": code
    ] }
}
