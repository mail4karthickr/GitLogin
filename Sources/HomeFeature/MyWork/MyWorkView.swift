//
//  File.swift
//  
//
//  Created by Karthick Ramasamy on 25/09/22.
//

import SwiftUI
import SwiftUINavigation

public struct MyWorkView: View {
    @StateObject var viewModel = MyWorkViewModel()
    
    public var body: some View {
        Section(header: HeaderView(action: { viewModel.headerTapped()  })) {
            List(viewModel.work) { work in
                switch work.type {
                case .issues:
                    issues
                case .pullRequests:
                    pullRequests
                case .repositories:
                    repositories
                case .starred:
                    starred
                case .discussions:
                    discussions
                case .organizations:
                    organizations
                }
            }
        }
        .sheet(unwrapping: self.$viewModel.route, case: /MyWorkViewModel.Route.editMyWork) { $allWork in
            NavigationView {
                EditMyWorkView(myWork: $allWork)
                    .navigationTitle("Edit My Work")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                          Button("Cancel") { self.viewModel.cancelButtonTapped() }
                        }
                        ToolbarItem(placement: .primaryAction) {
                          Button("Done") { self.viewModel.setMyWork(allWork) }
                        }
                    }
                    .environment(\.editMode, Binding.constant(EditMode.active))
            }
        }
    }
}

struct HeaderView: View {
    let action: () -> Void
    var body: some View {
        HStack {
            Text("My Work").font(.system(.body)).foregroundColor(.black)
            Spacer()
            Button(action: action) {
                Image(systemName: "ellipsis")
            }
        }
    }
}

struct MyWorkView_Previews: PreviewProvider {
    static var previews: some View {
        MyWorkView()
    }
}
