//
//  File.swift
//  
//
//  Created by Karthick Ramasamy on 11/03/22.
//

import Foundation
import XCTest
import Environment
import Service

extension XCTestCase {
  // Pushes an environment onto the stack, executes a closure, and then pops the environment from the stack.
  func withEnvironment(_ env: Environment, body: () throws -> Void) throws {
    AppEnvironment.pushEnvironment(env)
    try body()
    AppEnvironment.popEnvironment()
  }

  // Pushes an environment onto the stack, executes a closure, and then pops the environment from the stack.
  func withEnvironment(
    apiService: ServiceType = AppEnvironment.current.apiService,
    state: String = UUID().uuidString,
    bundle: BundleType = Bundle.main,
    body: () throws -> Void
  ) throws {
    try self.withEnvironment(
      Environment(
        apiService: apiService,
        state: state,
        bundle: bundle
      ),
      body: body
    )
  }
}
