//
//  File.swift
//  
//
//  Created by Karthick Ramasamy on 26/02/22.
//

import Foundation

public struct Authorization {
    let accessToken: String
    let scope: String
    let tokenType: String
    
    public init(accessToken: String, scope: String, tokenType: String) {
        self.accessToken = accessToken
        self.scope = scope
        self.tokenType = tokenType
    }
}

extension Authorization: Decodable {
    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case scope
        case tokenType = "token_type"
    }
}

extension Authorization: Equatable {}
