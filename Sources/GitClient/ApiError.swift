//
//  File.swift
//  
//
//  Created by Karthick Ramasamy on 10/10/22.
//

import Foundation

public enum ApiError: Error {
    case authenticationRequired
    case invalidRequest(Request)
    case badServerResponse(URLResponse)
    case invalidData(Data)
    case transportError(Error)
    case serverError(statusCode: Int)
    case noData
    case decodingError(Error)
    case encodingError(Error)
    case unknow
}
