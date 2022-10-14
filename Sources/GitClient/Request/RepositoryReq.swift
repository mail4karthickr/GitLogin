//
//  File.swift
//  
//
//  Created by Karthick Ramasamy on 12/10/22.
//

import Foundation

public struct RepositoryReq: Request {
    private let org: String
    
    public init(org: String) {
        self.org = org
    }
    
    public var path: String { "/orgs/\(org)/repos" }
}
