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
    
    var id: Int {
        switch self {
        case .first: return 1
        case .second: return 2
        case .third: return 3
        case .fourth: return 4
        case .fifth: return 5
        case .sixth: return 6
        case .seventh: return 7
        case .eighth: return 8
        case .ninth: return 9
        case .tenth: return 10
        case .eleventh: return 11
        case .twelfth: return 12
        }
    }
}
