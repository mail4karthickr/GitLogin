//
//  File.swift
//  
//
//  Created by Karthick Ramasamy on 25/09/22.
//

import Combine
import CasePaths

@MainActor
class MyWorkViewModel: ObservableObject {
    enum Route {
        case editMyWork([Work])
        case issues(IssuesViewModel)
        case pullRequests(PullRequestsViewModel)
        case repositories(RepositoriesViewModel)
        case starred(StarredViewModel)
        case discussions(DiscussionsViewModel)
        case organizations(OrganizationsViewModel)
    }
    @Published var work = Work.defaults
    @Published var route: Route?
    
    func headerTapped() {
        route = .editMyWork(work)
    }

    func setMyWork(_ work: [Work]) {
        self.work = work
        self.route = nil
    }
    
    func cancelButtonTapped() {
        self.route = nil
    }
}

extension MyWorkViewModel {
    func setIssuesNavigation(isActive: Bool) {
        self.route = isActive ? .issues(.init()) : nil
    }
    
    func setPullRequestsNavigation(isActive: Bool) {
        self.route = isActive ? .pullRequests(.init()) : nil
    }
    
    func setRepositoriesNavigation(isActive: Bool) {
        self.route = isActive ? .repositories(.init()) : nil
    }
    
    func setStarredNavigation(isActive: Bool) {
        self.route = isActive ? .starred(.init()) : nil
    }
    
    func setDiscussionsNavigation(isActive: Bool) {
        self.route = isActive ? .discussions(.init()) : nil
    }
    
    func setOrganizationsNavigation(isActive: Bool) {
        self.route = isActive ? .organizations(.init()) : nil
    }
    
    func setEditMyWorkNavigation(isActive: Bool) {
        self.route = isActive ? .organizations(.init()) : nil
    }
}
