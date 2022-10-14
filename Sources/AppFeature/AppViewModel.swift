//
//  File.swift
//  
//
//  Created by Karthick Ramasamy on 22/09/22.
//

import Foundation

public class AppViewModel: ObservableObject {
    
    public init(selectedTab: Tab) {
        self.selectedTab = selectedTab
    }
    
    @Published var selectedTab: Tab = .home
}
