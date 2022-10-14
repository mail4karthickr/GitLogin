//
//  File.swift
//  
//
//  Created by Karthick Ramasamy on 12/10/22.
//

import Foundation

public struct UserReq: Request {
    public init() {}

    public var path: String { "/user" }
}
