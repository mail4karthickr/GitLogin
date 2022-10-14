//
//  File.swift
//  
//
//  Created by Karthick Ramasamy on 09/10/22.
//

import SwiftUI

struct EditMyWorkView: View {
    @Binding var myWork: [Work]

    var body: some View {
        List {
            ForEach(myWork) { work in
                Text(work.title)
            }
            .onMove(perform: move)
        }
    }
    
    func move(from source: IndexSet, to destination: Int) {
        myWork.move(fromOffsets: source, toOffset: destination)
    }
}
