//
//  File.swift
//  
//
//  Created by Karthick Ramasamy on 22/09/22.
//

import Foundation
import Combine

class AppState: ObservableObject {
    static let shared = AppState()
    @Published var isSignOnSuccess = false
    @Published var authorization: Authorization? = nil
}
