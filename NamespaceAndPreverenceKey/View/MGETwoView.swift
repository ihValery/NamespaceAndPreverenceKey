//
//  MGETwoView.swift
//  NamespaceAndPreverenceKey
//
//  Created by Валерий Игнатьев on 7.05.22.
//

import SwiftUI

//MARK: - MGETwoView

struct MGETwoView: View {
    
    //MARK: Properties
    
    @State private var isFlagOne: Bool = false
    
    @Namespace var nspaceOne
    
    @State private var isFlagTwo: Bool = false
    
    @Namespace var nspaceTwo
    
    @State private var isFlagThree: Bool = false
    
    @Namespace var nspaceThree
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 30) {
                exampleOne()
                
                Divider()
                
                exampleTwo()
                
                Divider()
                
                exampleThree()
            }
        }
    }
    
    //MARK: Private Methotds
    
    private func exampleThree() -> some View {
        VStack(spacing: 30) {
            HStack(spacing: 30) {
                Triangle(.up, .purple)
                    .matchedGeometryEffect(id: "id3",
                                           in: nspaceThree)
                    .frame(width: 150, height: 150)
                    .border(.gray)
                
                Triangle(.right, .purple)
                    .matchedGeometryEffect(id: isFlagThree ? "id3" : "",
                                           in: nspaceThree,
                                           properties: .size,
//                                           properties: .position,
                                           isSource: false)
                    .frame(width: 75, height: 75)
                    .border(.gray)
            }
            .animation(.easeIn, value: isFlagThree)
            
            triangleBitton("Вместе", "Раздельно", .purple, flag: isFlagThree) {
                isFlagThree.toggle()
            }
        }
    }
    
    private func exampleTwo() -> some View {
        VStack(spacing: 30) {
            HStack(spacing: 30) {
                ZStack {
                    Triangle(.up, .green)
                    Triangle(.right, .green)
                    Triangle(.down, .green)
                }
                .matchedGeometryEffect(id: "id2",
                                       in: nspaceTwo)
                .frame(width: 150, height: 150)
                .border(.gray)
                
                Triangle(.left, .green)
                    .matchedGeometryEffect(id: isFlagTwo ? "id2" : "",
                                           in: nspaceTwo,
                                           isSource: false)
                    .frame(width: 75, height: 75)
                    .border(.gray)
            }
            .animation(.easeIn, value: isFlagTwo)
            
            triangleBitton("Вместе", "Раздельно", .green, flag: isFlagTwo) {
                isFlagTwo.toggle()
            }
        }
    }
    
    private func exampleOne() -> some View {
        VStack(spacing: 30) {
            if isFlagOne {
                ZStack {
                    Triangle(.left, .green)
                    Triangle(.up, .purple)
                    Triangle(.right, .red)
                    Triangle(.down, .blue)
                }
                .frame(width: 75, height: 75)
            } else {
                HStack {
                    Group {
                        Triangle(.left, .green)
                        Triangle(.up, .purple)
                        Triangle(.right, .red)
                        Triangle(.down, .blue)
                    }
                    .frame(width: 75, height: 75)
                }
                .animation(.default, value: isFlagOne)
            }
            
            triangleBitton("Разъединить", "Соединить", .gray, flag: isFlagOne) {
                isFlagOne.toggle()
            }
        }
    }
    
    private func triangleBitton(_ name: String,
                                _ subName: String,
                                _ color: Color,
                                flag: Bool,
                                action: @escaping () -> Void ) -> some View {
        
        Button {
            action()
        } label: {
            HStack(spacing: 0) {
                Triangle(.right, color, isBorder: false)
                    .frame(width: 40, height: 40)
                
                Text(flag ? name : subName)
                    .foregroundColor(.white)
                    .font(.title3)
                    .fontWeight(.medium)
                    .frame(width: 190, height: 40)
                    .background(color)
                
                Triangle(.left, color, isBorder: false)
                    .frame(width: 40, height: 40)
            }
        }
    }
}

//MARK: - PreviewProvider

struct MGETwoView_Previews: PreviewProvider {
    static var previews: some View {
        MGETwoView()
    }
}
