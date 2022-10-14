//
//  File.swift
//  
//
//  Created by Karthick Ramasamy on 11/03/22.
//

import SwiftUI

public struct LoginButtonText: View {
    let title: String

    public init(_ title: String) {
        self.title = title
    }

    public var body: some View {
        Text(title)
            .font(.system(size: 18))
            .padding()
            .frame(maxWidth: .infinity)
            .cornerRadius(30)
            .padding(.horizontal)
    }
}
