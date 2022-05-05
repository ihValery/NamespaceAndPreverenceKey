//
//  TabModel.swift
//  NamespaceAndPreverenceKey
//
//  Created by Валерий Игнатьев on 5.05.22.
//

import SwiftUI

//MARK: - TabModel

struct TabModel: Identifiable, Equatable {
    
    var id: UUID
    var number: Int
    var name: String
    var color: Color
    var tab: Tab
    
    //MARK: Initializer
    
    init(_ number: Int, _ color: Color,_ tab: Tab) {
        id = UUID()
        self.number = number
        self.name = tab.rawValue.capitalized
        self.color = color
        self.tab = tab
    }
}

//MARK: - Enum

enum Tab: String {
    case first
    case second
    case third
    case fourth
    case fifth
    case sixth
    case seventh
    case eighth
    case ninth
    case tenth
    case eleventh
    case twelfth
}
