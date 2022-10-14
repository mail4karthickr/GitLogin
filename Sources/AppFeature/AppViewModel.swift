//
//  File.swift
//  
//
//  Created by Karthick Ramasamy on 22/09/22.
//

import Foundation
import Models

public class AppViewModel: ObservableObject {
    @Published var selectedTab: Tab
    private var authorization: Authorization

    public init(
        selectedTab: Tab = .home,
        authorization: Authorization
    ) {
        self.selectedTab = selectedTab
        self.authorization = authorization
    }
}
