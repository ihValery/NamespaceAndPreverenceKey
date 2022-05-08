//
//  MultipleNamespaces.swift
//  NamespaceAndPreverenceKey
//
//  Created by Валерий Игнатьев on 8.05.22.
//

import SwiftUI

//MARK: - MultipleNamespaces

struct MultipleNamespaces: View {
    
    //MARK: Properties
    
    @Namespace private var one
    @Namespace private var two
    @Namespace private var three
    @Namespace private var fore
    @Namespace private var five
    @Namespace private var six
    @Namespace private var seven
    @Namespace private var eight
    @Namespace private var nine
    @Namespace private var ten
    @Namespace private var unpair
    
    @State private var activeNSpace: Int = 0
    
    var body: some View {
        VStack(spacing: 30) {
            grayShape()
            
            trianglesUnpair()
            
            unpairButton()
        }
        .animation(.easeInOut, value: activeNSpace)
    }
    
    //MARK: Private Methods
    
    private func grayShape() -> some View {
        VStack(spacing: 30) {
            LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
                shadowShapeButton(namespace: one, width: 60, .up, .none, .none, .none)
                shadowShapeButton(namespace: two, width: 90, .left, .right, .none, .none)
                shadowShapeButton(namespace: three, width: 30, .up, .none, .none, .none)
                shadowShapeButton(namespace: fore, width: 60, .up, .none, .none, .none)
                shadowShapeButton(namespace: five, width: 70, .up, .right, .down, .left)
                shadowShapeButton(namespace: six, width: 60, .up, .none, .none, .none)
                shadowShapeButton(namespace: seven, width: 60, .up, .none, .none, .none)
                shadowShapeButton(namespace: eight, width: 60, .up, .none, .none, .none)
                shadowShapeButton(namespace: nine, width: 60, .up, .none, .none, .none)
                shadowShapeButton(namespace: ten, width: 60, .up, .none, .none, .none)
            }
        }
    }
    
    private func shadowShapeButton(namespace: Namespace.ID,
                                   width: CGFloat = 60,
                                   _ one: Direction?,
                                   _ two: Direction? = nil,
                                   _ three: Direction? = nil,
                                   _ four: Direction? = nil) -> some View {
        
        Button {
            activeNSpace = namespace.hashValue
        } label: {
            ZStack {
                oneShadowTriangle(one, namespace: namespace)
                oneShadowTriangle(two, namespace: namespace)
                oneShadowTriangle(three, namespace: namespace)
                oneShadowTriangle(four, namespace: namespace)
            }
            .frame(width: width, height: width)
        }
    }
    
    @ViewBuilder private func oneShadowTriangle(_ direction: Direction?,
                                                namespace: Namespace.ID) -> some View {
        if let direction = direction {
            Triangle(direction, .gray.opacity(0.4), isBorder: false)
                .matchedGeometryEffect(id: direction.id, in: namespace)
        }
    }
    
    private func trianglesUnpair() -> some View {
        HStack(spacing: 30) {
            oneTriangle(.up, .green)
            oneTriangle(.right, .yellow)
            oneTriangle(.down, .blue)
            oneTriangle(.left, .red)
        }
    }
    
    private func oneTriangle(_ alignment: Direction, _ color: Color) -> some View {
        Triangle(alignment, color, isBorder: activeNSpace == 0 ? true : false)
            .matchedGeometryEffect(id: alignment.id,
                                   in: activeNamespace(),
                                   isSource: false)
            .frame(width: 60, height: 60)
    }
    
    private func unpairButton() -> some View {
        Button {
            activeNSpace = 0
        } label: {
            Text("Unpair")
                .foregroundColor(.black)
                .frame(maxWidth: .infinity)
                .frame(height: 40)
                .background(
                    RoundedRectangle(cornerRadius: 13, style: .continuous)
                        .fill(.gray.opacity(0.4))
                )
        }
        .padding(.horizontal, 25)
    }
    
    private func activeNamespace() -> Namespace.ID {
        switch activeNSpace {
        case one.hashValue: return one
        case two.hashValue: return two
        case three.hashValue: return three
        case fore.hashValue: return fore
        case five.hashValue: return five
        case six.hashValue: return six
        case seven.hashValue: return seven
        case eight.hashValue: return eight
        case nine.hashValue: return nine
        case ten.hashValue: return ten
        default: return unpair
        }
    }
}

//MARK: - PreviewProvider

struct MultipleNamespaces_Previews: PreviewProvider {
    static var previews: some View {
        MultipleNamespaces()
    }
}
