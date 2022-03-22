//
//  AppViewModel.swift
//  GithubLogin
//
//  Created by Karthick Ramasamy on 26/02/22.
//

import Foundation
import Combine

class AppViewModel: ObservableObject {
    private init() {}
    public static let shared = AppViewModel()
    
    @Published var state: String = UUID().uuidString
}
