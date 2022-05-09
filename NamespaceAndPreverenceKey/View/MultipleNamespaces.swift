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
    @Namespace private var eleven
    @Namespace private var twelve
    @Namespace private var thirteen
    @Namespace private var fourteen
    @Namespace private var fifteen

    @Namespace private var unpair
    
    @State private var activeNSpace: Int = 0
    
    private let columns: [GridItem] = Array(repeating: GridItem(.fixed(110)), count: 3)
    
    var body: some View {
        VStack(spacing: 0) {
            allShadowShapes()
                    
            Spacer()
            trianglesUnpair()
            Spacer()
            
            unpairButton()
        }
        .animation(.easeInOut, value: activeNSpace)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    //MARK: Private Methods
    
    private func allShadowShapes() -> some View {
        LazyVGrid(columns: columns) {
            Group {
                shadowShapeButton(namespace: one, width: 60, .left, .none, .none, .none)
                shadowShapeButton(namespace: two, width: 75, .left, .right, .none, .none)
                shadowShapeButton(namespace: three, width: 40, .left, .down, .none, .none)
                
                shadowShapeButton(namespace: fore, width: 55, .right, .down, .none, .none)
                shadowShapeButton(namespace: five, width: 70, .up, .right, .down, .left)
                shadowShapeButton(namespace: six, width: 60, .left, .up, .none, .none)
                
                shadowShapeButton(namespace: seven, width: 65, .right, .down, .left, .none)
                shadowShapeButton(namespace: eight, width: 60, .down, .none, .none, .none)
                shadowShapeButton(namespace: nine, width: 60, .up, .down, .none, .none)
            }
            
            Group {
                shadowShapeButton(namespace: ten, width: 60, .up, .right, .none, .none)
                shadowShapeButton(namespace: eleven, width: 30, .up, .none, .none, .none)
                shadowShapeButton(namespace: twelve, width: 75, .down, .right, .none, .none)
                
                shadowShapeButton(namespace: thirteen, width: 60, .up, .left, .down, .none)
                shadowShapeButton(namespace: fourteen, width: 70, .up, .none, .none, .none)
                shadowShapeButton(namespace: fifteen, width: 60, .right, .none, .none, .none)
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
            .frame(width: 100, height: 100)
            .background(
                RoundedRectangle(cornerRadius: 13, style: .continuous)
                    .fill(.gray.opacity(0.4))
            )
        }
    }
    
    @ViewBuilder private func oneShadowTriangle(_ direction: Direction?,
                                                namespace: Namespace.ID) -> some View {
        if let direction = direction {
            Triangle(direction, .white, isBorder: false)
                .matchedGeometryEffect(id: direction.id, in: namespace)
        }
    }
    
    private func trianglesUnpair() -> some View {
        HStack(spacing: 30) {
            oneTriangle(.right, .yellow)
            oneTriangle(.up, .green)
            oneTriangle(.down, .blue)
            oneTriangle(.left, .red)
        }
    }
    
    private func oneTriangle(_ alignment: Direction, _ color: Color) -> some View {
        ZStack {
            Triangle(alignment, .gray.opacity(0.1), isBorder: false)

            Triangle(alignment, color, isBorder: false)
                .matchedGeometryEffect(id: alignment.id,
                                       in: activeNamespace(),
                                       isSource: false)
        }
        .frame(width: 60, height: 60)
    }
    
    private func unpairButton() -> some View {
        Button {
            activeNSpace = 0
        } label: {
            Text("U  n  p  a  i  r")
                .font(.title)
                .foregroundColor(.white)
                .fontWeight(.medium)
                .frame(maxWidth: .infinity)
                .frame(height: 50)
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
        case eleven.hashValue: return eleven
        case twelve.hashValue: return twelve
        case thirteen.hashValue: return thirteen
        case fourteen.hashValue: return fourteen
        case fifteen.hashValue: return fifteen
            
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
