//
//  AnchorPoint.swift
//  NamespaceAndPreverenceKey
//
//  Created by Валерий Игнатьев on 8.05.22.
//

import SwiftUI

//MARK: - AnchorPoint

struct AnchorPoint: View {
    
    //MARK: Properties
    
    @State private var aligment: AlignmentPoint = .topLeading
    
    @Namespace var anchorPoint
    
    private let color: Color = .red
    
    var body: some View {
        VStack(spacing: 30) {
            ZStack(alignment: .center) {
                Triangle(.left, .black)
                    .matchedGeometryEffect(id: "anchorPoint",
                                           in: anchorPoint,
                                           anchor: aligment.unitPoint,
                                           isSource: false)
                
                Triangle(.up, .red)
                    .overlay(dotIndicator(), alignment: .topLeading)
                    .matchedGeometryEffect(id: "anchorPoint",
                                           in: anchorPoint,
                                           anchor: .topLeading)
            }
            .frame(width: 75, height: 75)
            
            markingWithAnchorButton()
        }
        .animation(.easeInOut, value: aligment)
    }
    
    //MARK: Private Methotds
    
    private func dotIndicator() -> some View {
        Circle()
            .fill(color)
            .frame(width: 8, height: 8)
            .offset(x: -3, y: -3)
    }
    
    private func markingWithAnchorButton() -> some View {
        ZStack {
            marking()
            
            anchorButton(.topLeading)
            anchorButton(.top)
            anchorButton(.topTrailing)
            
            anchorButton(.leading)
            anchorButton(.center)
            anchorButton(.trailing)
            
            anchorButton(.bottomLeading)
            anchorButton(.bottom)
            anchorButton(.bottomTrailing)
        }
        .frame(height: 113)
        .padding(.horizontal, 30)
    }
    
    private func anchorButton(_ aligment: AlignmentPoint) -> some View {
        Text(aligment.anchorName)
            .font(.caption2)
            .foregroundColor(.white)
            .padding(.horizontal, 5)
            .frame(height: 15)
            .background(Capsule().fill(self.aligment == aligment ? .black : color))
        
            .onTapGesture {
                self.aligment = aligment
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: aligment.anchorValue)
    }
    
    private func marking() -> some View {
        ZStack {
            Rectangle()
                .frame(width: 1)
            
            Rectangle()
                .frame(height: 1)
        }
        .foregroundColor(.black)
        .border(.black)
        .frame(height: 100)
        .padding(.horizontal, 30)
    }
}

//MARK: - PreviewProvider

struct AnchorsPoint_Previews: PreviewProvider {
    static var previews: some View {
        AnchorPoint()
    }
}

//MARK: - AlignmentPoint

enum AlignmentPoint {
    case topLeading
    case top
    case topTrailing
    case trailing
    case bottomTrailing
    case bottom
    case bottomLeading
    case leading
    case center
    
    var anchorName: String {
        switch self {
        case .topLeading: return ".topLeading"
        case .top: return ".top"
        case .topTrailing: return ".topTrailing"
        case .trailing: return ".trailing"
        case .bottomTrailing: return ".bottomTrailing"
        case .bottom: return ".bottom"
        case .bottomLeading: return ".bottomLeading"
        case .leading: return ".leading"
        case .center: return ".center"
        }
    }
    
    var anchorValue: Alignment {
        switch self {
        case .topLeading: return .topLeading
        case .top: return .top
        case .topTrailing: return .topTrailing
        case .trailing: return .trailing
        case .bottomTrailing: return .bottomTrailing
        case .bottom: return .bottom
        case .bottomLeading: return .bottomLeading
        case .leading: return .leading
        case .center: return .center
        }
    }
    
    var unitPoint: UnitPoint {
        switch self {
        case .topLeading: return .topLeading
        case .top: return .top
        case .topTrailing: return .topTrailing
        case .trailing: return .trailing
        case .bottomTrailing: return .bottomTrailing
        case .bottom: return .bottom
        case .bottomLeading: return .bottomLeading
        case .leading: return .leading
        case .center: return .center
        }
    }
}
