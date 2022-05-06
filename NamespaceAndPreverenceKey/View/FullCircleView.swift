//
//  FullCircleView.swift
//  NamespaceAndPreverenceKey
//
//  Created by Валерий Игнатьев on 6.05.22.
//

import SwiftUI

//MARK: - FullCircleView

struct FullCircleView: View {
    
    //MARK: Properties
    
    private var colors: [Color]
        
    private var rotationDegrees: Double
    
    var body: some View {
        ZStack {
            halfCircle(.zero, colors[0])
            halfCircle(.first, colors[1])
        }
        .rotationEffect(.degrees(rotationDegrees))
    }
    
    //MARK: Initializer
    
    init(_ colors: [Color],_ rotationDegrees: Double) {
        self.colors = colors
        self.rotationDegrees = rotationDegrees
    }
    
    //MARK: Private Methotds

    private func halfCircle(_ side: SideCircle,_ color: Color) -> some View {
        HalfCircle(side)
            .foregroundColor(color)
            .defaultShadow(color)
    }
}

//MARK: - PreviewProvider

struct FlowerView_Previews: PreviewProvider {
    static let colors: [Color] = [.purple, .yellow]
    
    static var previews: some View {
        FullCircleView(colors, 0)
            .scaleEffect(0.7)
    }
}
