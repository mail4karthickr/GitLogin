//
//  File.swift
//  
//
//  Created by Karthick Ramasamy on 10/03/22.
//

import SwiftUI

public struct LoaderButton: View {
    public var isLoading: Bool
    public let title: String
    public let action: () -> Void
    
    public init(isLoading: Bool, title: String, action: @escaping () -> Void) {
        self.isLoading = isLoading
        self.title = title
        self.action = action
    }
    
    public var body: some View {
        Button(action: action) {
            if isLoading {
                Text("loading")
                    .font(.system(size: 18))
                    .padding()
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                    .background(Color.black)
                    .cornerRadius(30)
                    .padding(.horizontal)
            } else {
                Text(title)
                    .font(.system(size: 18))
                    .padding()
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                    .background(Color.black)
                    .cornerRadius(30)
                    .padding(.horizontal)
            }
        }
    }
}
