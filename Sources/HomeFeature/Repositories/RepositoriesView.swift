//
//  SwiftUIView.swift
//  
//
//  Created by Karthick Ramasamy on 08/10/22.
//

import SwiftUI

struct RepositoriesView: View {
    @ObservedObject var viewModel: RepositoriesViewModel

    var body: some View {
        Text("RepositoriesView")
            .onAppear {
                viewModel.fetchRepositories()
            }
    }
}

//struct RepositoriesView_Previews: PreviewProvider {
//    static var previews: some View {
//        RepositoriesView()
//    }
//}
