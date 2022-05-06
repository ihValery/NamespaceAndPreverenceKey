//
//  ViewModifier.swift
//  NamespaceAndPreverenceKey
//
//  Created by Валерий Игнатьев on 6.05.22.
//

import SwiftUI

//MARK: - ViewModifier

struct DefaultShadow: ViewModifier {
    
    //MARK: Properties
    
    var color: Color
    
    func body(content: Content) -> some View {
        content
            .shadow(color: color, radius: 10, x: 0, y: 0)
            .shadow(color: .primary.opacity(0.3), radius: 10, x: 0, y: 0)
    }
}

//MARK: - Extension

extension View {
    func defaultShadow(_ color: Color) -> some View {
        self.modifier(DefaultShadow(color: color))
    }
}
