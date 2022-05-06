//
//  HalfCircle.swift
//  CircleMenu
//
//  Created by Валерий Игнатьев on 29.10.2021.
//

import SwiftUI

//MARK: - HalfCircle

struct HalfCircle: Shape {
    
    //MARK: Properties
    
    private var startAngle: Angle
    
    private var endAngle: Angle
    
    //MARK: Initializer
        
    init(_ side: SideCircle) {
        startAngle = .degrees(side.rawValue + 90)
        endAngle = .degrees(side.rawValue + 270)
    }
    
    //MARK: Public Methotds
    
    func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.midX, y: rect.midY)
        
        var p = Path()
        p.addArc(center: center,
                 radius: UIScreen.main.bounds.width / 1.5,
                 startAngle: startAngle + .degrees(2),
                 endAngle: endAngle - .degrees(2),
                 clockwise: false)
        return p
    }
}
