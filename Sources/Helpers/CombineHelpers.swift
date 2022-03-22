//
//  File.swift
//  
//
//  Created by Karthick Ramasamy on 12/03/22.
//

import Combine

extension AnyPublisher {
  public init(_ value: Output) {
    self = Just(value).setFailureType(to: Failure.self).eraseToAnyPublisher()
  }
}
