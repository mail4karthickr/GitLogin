//
//  SwiftUIView.swift
//  
//
//  Created by Karthick Ramasamy on 22/09/22.
//

import SwiftUI

public struct HomeView: View {
    public init() {}

    public var body: some View {
        NavigationView {
            Form {
                MyWorkView()
            }
            .navigationBarTitle(Text("Home"))
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
