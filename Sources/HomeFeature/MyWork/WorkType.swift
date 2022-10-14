//
//  File.swift
//  
//
//  Created by Karthick Ramasamy on 25/09/22.
//

import Foundation
import CasePaths

struct Work: Identifiable {
    let type: WorkType
    let title: String
    let image: String
    
    let id = UUID().uuidString
    
    static let issues = Self(type: .issues, title: "Issues", image: "")
    static let pullRequests = Self(type: .pullRequests, title: "PullRequests", image: "")
    static let repositories = Self(type: .repositories, title: "Repositories", image: "")
    static let starred = Self(type: .starred, title: "Starred", image: "")
    static let discussions = Self(type: .discussions, title: "Discussions", image: "")
    static let organizations = Self(type: .organizations, title: "Organizations", image: "")
    
    static let defaults = [issues, pullRequests, repositories, starred, discussions, organizations]
}

enum WorkType {
    case issues
    case pullRequests
    case repositories
    case starred
    case discussions
    case organizations
}

extension WorkType {}
