//
//  SwiftUIView.swift
//  
//
//  Created by Karthick Ramasamy on 08/10/22.
//

import SwiftUI

struct PullRequestsView: View {
    @ObservedObject var viewModel: PullRequestsViewModel

    init(viewModel: PullRequestsViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        Text("PullRequestsView")
    }
}
//
//struct PullRequestsView_Previews: PreviewProvider {
//    static var previews: some View {
//        PullRequestsView()
//    }
//}
