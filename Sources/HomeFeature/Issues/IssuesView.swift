//
//  SwiftUIView.swift
//  
//
//  Created by Karthick Ramasamy on 08/10/22.
//

import SwiftUI

struct IssuesView: View {
    @ObservedObject var viewModel: IssuesViewModel
    
    init(viewModel: IssuesViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

//struct IssuesView_Previews: PreviewProvider {
//    static var previews: some View {
//        IssuesView()
//    }
//}
