//
//  AppEnvironment.swift
//  GithubLogin
//
//  Created by Karthick Ramasamy on 26/02/22.
//

import Foundation

/**
 A global stack that captures the current state of global objects that the app wants access to.
 */
public struct AppEnvironment {

    /**
     A global stack of environments.
     */
    fileprivate static var stack: [Environment] = [Environment()]

    // The most recent environment on the stack.
    public static var current: Environment! {
      return stack.last
    }

    // Push a new environment onto the stack.
    public static func pushEnvironment(_ env: Environment) {
      self.stack.append(env)
    }

    // Pop an environment off the stack.
    @discardableResult
    public static func popEnvironment() -> Environment? {
      return self.stack.popLast()
    }
}
