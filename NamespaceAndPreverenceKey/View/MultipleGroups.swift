//
//  MultipleGroups.swift
//  NamespaceAndPreverenceKey
//
//  Created by Валерий Игнатьев on 8.05.22.
//

import SwiftUI

//MARK: - MultipleGroups

struct MultipleGroups: View {
    
    //MARK: Properties
    
    @Namespace var multipleGroups
        
    @State private var isOn: Bool = false
    
    var body: some View {
        exampleOne()
    }
    
    //MARK: Private Methods
        
    private func exampleOne() -> some View {
        VStack(spacing: 30) {
            HStack(spacing: 10) {
                Triangle(.up, .yellow)
                    .matchedGeometryEffect(id: "groups1",
                                           in: multipleGroups)
                    .frame(width: 60, height: 60)
                
                Triangle(.right, .orange)
                    .matchedGeometryEffect(id: isOn ? "groups1" : "unpair1",
                                           in: multipleGroups,
                                           isSource: false)
                    .frame(width: 60, height: 60)
                
                Triangle(.down, .pink)
                    .matchedGeometryEffect(id: isOn ? "groups2" : "unpair2",
                                           in: multipleGroups,
                                           isSource: false)
                    .frame(width: 60, height: 60)
                
                Triangle(.left, .red)
                    .matchedGeometryEffect(id: isOn ? "groups2" : "unpair2",
                                           in: multipleGroups,
                                           isSource: false)
                    .frame(width: 60, height: 60)
                
                Triangle(.up, .yellow)
                    .matchedGeometryEffect(id: "groups2",
                                           in: multipleGroups)
                    .frame(width: 60, height: 60)
            }
            .animation(.spring(response: 0.3, dampingFraction: 0.7), value: isOn)
            
            Toggle(isOn ? "Сгруппировать" : "Разгруппировать", isOn: $isOn)
                .tint(.accentColor)
                .padding(.horizontal, 60)
        }
    }
}

//MARK: - PreviewProvider

struct MultipleGroups_Previews: PreviewProvider {
    static var previews: some View {
        MultipleGroups()
    }
}
