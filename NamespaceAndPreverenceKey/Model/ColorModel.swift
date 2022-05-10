//
//  ColorModel.swift
//  NamespaceAndPreverenceKey
//
//  Created by Валерий Игнатьев on 10.05.22.
//

import SwiftUI

//MARK: - ColorModel

struct ColorModel: Identifiable {
    
    //MARK: Properties
    
    var id: UUID
    var name: String
    var color: Color
    
    //MARK: Initializer
    
    init(_ color: Color) {
        id = UUID()
        self.color = color
        name = color.description.capitalized
    }
}
