//
//  TabModel.swift
//  NamespaceAndPreverenceKey
//
//  Created by Валерий Игнатьев on 5.05.22.
//

import SwiftUI

//MARK: - TabModel

struct TabModel: Identifiable {
    
    var id: UUID
    var number: Int
    var color: Color
    
    //MARK: Initializer
    
    init(_ number: Int,_ color: Color) {
        id = UUID()
        self.number = number
        self.color = color
    }
}
