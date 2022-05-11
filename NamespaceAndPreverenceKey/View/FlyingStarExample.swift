//
//  FlyingStarExample.swift
//  NamespaceAndPreverenceKey
//
//  Created by Валерий Игнатьев on 10.05.22.
//

import SwiftUI

//MARK: - FlyingStarExample

struct FlyingStarExample: View {
    
    @Namespace private var namespace
    
    @Namespace private var namespaceTwo
    
    @State private var isFlag: Bool = true
    
    @State private var isFlagTwo: Bool = true

    private let array: [Int] = [1, 2, 3, 4]
    
    @State private var favorites: [Int] = []
    
    var body: some View {
        VStack(spacing: 50) {
            HStack {
                ForEach(favorites, id: \.self) { number in
                    RoundedRectangle(cornerRadius: isFlag ? 13 : 30, style: .continuous)
                        .fill(.red)
                        .matchedGeometryEffect(id: isFlag ? number : 0,
                                               in: namespace,
                                               isSource: false)
                        .frame(width: 60, height: 60)
                }
            }
            .padding(.horizontal)
            .frame(maxWidth: .infinity, alignment: .trailing)
            
            
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(array, id: \.self) { number in
                    RoundedRectangle(cornerRadius: 13, style: .continuous)
                        .opacity(0.4)
                        .matchedGeometryEffect(id: number, in: namespace)
                        .frame(height: 300)
                        .padding(.horizontal)
                        .onTapGesture {
                            favorites.append(number)
                            isFlag.toggle()
                        }
                }
            }
        }
        .animation(.linear(duration: 2), value: isFlag)
    }
}

//MARK: - PreviewProvider

struct FlyingStarExample_Previews: PreviewProvider {
    static var previews: some View {
        FlyingStarExample()
    }
}
