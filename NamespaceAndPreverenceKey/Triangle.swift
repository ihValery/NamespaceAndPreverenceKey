//
//  Triangle.swift
//  NamespaceAndPreverenceKey
//
//  Created by Валерий Игнатьев on 7.05.22.
//

import SwiftUI

//MARK: - Triangle

struct Triangle: View {
    
    //MARK: Properties
    
    private let direction: Direction
    
    private let color: Color
    
    private let isBorder: Bool
    
    var body: some View {
        TtiangleShape()
            .fill(color)
            .border(.black.opacity(isBorder ? 1 : 0))
            .rotationEffect(.degrees(direction.rawValue))
    }
    
    //MARK: Shape

    private struct TtiangleShape: Shape {
        func path(in rect: CGRect) -> Path {
            var p = Path()
            
            p.move(to: .zero)
            p.addLine(to: CGPoint(x: rect.maxX, y: 0))
            p.addLine(to: CGPoint(x: rect.midX, y: rect.midY))
            p.closeSubpath()
            
            return p
        }
    }
    
    //MARK: Initializer
    
    init(_ direction: Direction,_ color: Color, isBorder: Bool = true) {
        self.direction = direction
        self.color = color
        self.isBorder = isBorder
    }
}

//MARK: - PreviewProvider

struct Triangle_Previews: PreviewProvider {
    static var previews: some View {
        Triangle(.down, .green)
            .frame(width: 100, height: 100)
    }
}

//MARK: - Enum

enum Direction: Double {
    case up = 0
    case right = 90
    case down = 180
    case left = 270
    
    var id: String {
        switch self {
        case .up: return "up"
        case .right: return "right"
        case .down: return "down"
        case .left: return "left"
        }
    }
}
