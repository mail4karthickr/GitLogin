//
//  File.swift
//  
//
//  Created by Karthick Ramasamy on 10/03/22.
//

import Foundation
import SwiftUI

extension Image {
    public init(name: String, ofType type: String = "png") {
        guard let path = Bundle.module.path(forResource: name, ofType: type),
              let image = UIImage(contentsOfFile: path) else {
            self.init(name)
            return
        }
        self.init(uiImage: image)
    }
}
