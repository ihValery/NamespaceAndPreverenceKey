//
//  MatchedGeometryEffectView.swift
//  NamespaceAndPreverenceKey
//
//  Created by Валерий Игнатьев on 7.05.22.
//

import SwiftUI

//MARK: - MatchedGeometryEffectView

struct MatchedGeometryEffectView: View {
    
    //MARK: Properties
    
    @Namespace private var nspaceOne
    
    @Namespace private var nspaceTwo
    
    @State private var flagOne: Bool = true
    
    @State private var flagTwo: Bool = true
    
    var body: some View {
        VStack(spacing: 30) {
            exampleOne()
            
            exampleTwo()
        }
        .padding()
    }
    
    //MARK: Private Methotds
    
    private func exampleTwo() -> some View {
        HStack {
            if flagTwo {
                VStack {
                    PolygonView(color: Color.green)
                        .matchedGeometryEffect(id: "effectTwo", in: nspaceTwo)
                        .frame(width: 200, height: 200)
                }
                .transition(.polygonTriangle)
            }
            
            Spacer()
            
            buttonSwitch { flagTwo.toggle() }
            
            Spacer()
            
            if !flagTwo {
                VStack {
                    PolygonView(color: Color.blue)
                        .matchedGeometryEffect(id: "effectTwo", in: nspaceTwo)
                        .frame(width: 200, height: 200)
                }
                .transition(.polygonCircle)
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
        .border(.purple, width: 2)
    }
    
    private func exampleOne() -> some View {
        HStack {
            square()
            
            Spacer()
            
            buttonSwitch { flagOne.toggle() }
            
            Spacer()
            
            VStack {
                smallSquare()
                circle()
                smallSquare()
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
        .border(.purple, width: 2)
    }
    
    @ViewBuilder private func circle() -> some View {
        if !flagOne {
            Circle()
                .fill(.blue)
                .matchedGeometryEffect(id: "effectOne", in: nspaceOne)
                .frame(width: 50, height: 50)
                .border(.black)
                .zIndex(1)
        }
    }
    
    @ViewBuilder private func square() -> some View {
        if flagOne {
            Rectangle()
                .fill(.yellow)
                .matchedGeometryEffect(id: "effectOne", in: nspaceOne)
                .frame(width: 100, height: 100)
        }
    }
    
    private func smallSquare() -> some View {
        Rectangle()
            .fill(.pink)
            .frame(width: 50, height: 50)
    }
    
    
    private func buttonSwitch(_ action: @escaping () -> Void) -> some View {
        Button {
            withAnimation(.easeInOut(duration: 2)) {
                action()
            }
        } label: {
            Text("Switch")
                .foregroundColor(.primary)
                .font(.title3)
                .fontWeight(.medium)
        }
    }
}

//MARK: - PreviewProvider

struct MatchedGeometryEffectView_Previews: PreviewProvider {
    static var previews: some View {
        MatchedGeometryEffectView()
    }
}
