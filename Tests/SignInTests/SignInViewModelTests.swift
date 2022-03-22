//
//  SignInViewModelTests.swift
//  
//
//  Created by Karthick Ramasamy on 11/03/22.
//

import XCTest
import CasePaths
import CombineExpectations

@testable import MockService
@testable import Models
@testable import SignIn

class SignInViewModelTests: XCTestCase {
    func testSignIn() {
        let viewModel = SignInViewModel()
    }
    
    func testSignInWithGitHub() {
        let viewModel = SignInViewModel()
        viewModel.signInWithGitHub()
        let gitHubSignViewModel = (/SignInViewModel.Route.signInWithGitHub).extract(from: viewModel.route)
        XCTAssertNotNil(gitHubSignViewModel)
    }
    
    func testFetchAccessToken() throws {
        let viewModel = SignInViewModel()
        let response: Authorization = .template
        let mockService = MockService(fetchAccessTokenResponse: response)
        try withEnvironment(apiService: mockService) {
            viewModel.fetchAccessToken(.init(code: "", state: "123"))
            let routeRecorder =  viewModel.$route.record()
            let routeElements = try wait(for: routeRecorder.next(2), timeout: 10)
            XCTAssertEqual(routeElements, [nil, .rootView(response)])
        }
    }
    
    func testPrivacyPolicyTapped() throws {
        let viewModel = SignInViewModel()
        let routeRecorder = viewModel.$route.record()
        viewModel.privacyPolicyTapped()
        let elements = try wait(for: routeRecorder.next(2), timeout: 10)
        XCTAssertEqual(elements, [nil, .safariView(AppConstants.privacyPolicy)])
    }
}
