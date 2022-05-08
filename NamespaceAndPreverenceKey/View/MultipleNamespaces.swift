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
    
    @Namespace var yellow
    
    @Namespace var yellowGray
    
    @Namespace var green

    @Namespace var greenGray

    @Namespace var purple

    @Namespace var purpleGray

    @Namespace var blue
    
    @Namespace var blueGray
    
    @State private var namespaceColor: Int = 0
    
    var body: some View {
        VStack(spacing: 30) {
            colorOpacity()
            
            grayShape()
            
            triangles()
         
            unpairButton()
        }
    }
    
    //MARK: Private Methods
    
    private func colorOpacity() -> some View {
        HStack(spacing: 30) {
            rectangleColor(.yellow)
                .matchedGeometryEffect(id: "yellow", in: yellow)
            
            rectangleColor(.green)
                .matchedGeometryEffect(id: "green", in: green)
            
            rectangleColor(.purple)
                .matchedGeometryEffect(id: "purple", in: purple)
            
            rectangleColor(.blue)
                .matchedGeometryEffect(id: "blue", in: blue)
        }
    }
    
    private func grayShape() -> some View {
        HStack(spacing: 30) {
            ZStack {
                Triangle(.up, .gray.opacity(0.4), isBorder: false)
                Triangle(.down, .gray.opacity(0.4), isBorder: false)
            }
            .matchedGeometryEffect(id: "yellowGray", in: yellowGray)
            .frame(width: 60, height: 60)
            
            ZStack {
                Triangle(.up, .gray.opacity(0.4), isBorder: false)
                Triangle(.right, .gray.opacity(0.4), isBorder: false)
            }
            .frame(width: 60, height: 60)
            
            ZStack {
                Triangle(.left, .gray.opacity(0.4), isBorder: false)
                Triangle(.right, .gray.opacity(0.4), isBorder: false)
            }
            .frame(width: 60, height: 60)
            
            ZStack {
                Triangle(.left, .gray.opacity(0.4), isBorder: false)
                Triangle(.down, .gray.opacity(0.4), isBorder: false)
            }
            .frame(width: 60, height: 60)
        }
    }
    
    private func triangles() -> some View {
        HStack(spacing: 30) {
            Triangle(.up, .yellow)
                .frame(width: 60, height: 60)
            
            Triangle(.right, .green)
                .frame(width: 60, height: 60)
            
            Triangle(.down, .purple)
                .frame(width: 60, height: 60)
            
            Triangle(.left, .blue)
                .frame(width: 60, height: 60)
        }
    }
    
    private func unpairButton() -> some View {
        Button {
            namespaceColor = 0
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
        .padding(.horizontal)
    }
    
    private func rectangleColor(_ color: Color) -> some View {
        Rectangle()
            .fill(color.opacity(0.4))
            .frame(width: 60, height: 60)
    }
}

//MARK: - PreviewProvider

struct MultipleNamespaces_Previews: PreviewProvider {
    static var previews: some View {
        MultipleNamespaces()
    }
}
