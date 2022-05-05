//
//  TabBarVM.swift
//  NamespaceAndPreverenceKey
//
//  Created by Валерий Игнатьев on 5.05.22.
//

import SwiftUI

//MARK: - TabBarVM

final class TabBarVM: ObservableObject {
    
    //MARK: Properties
        
    @Published var tabs: [TabModel] = []
    
    @Published var arrayOffsets: [CGFloat] = [0]
    
    //MARK: Initializer
    
    init() {
        getTabsData()
    }
        
    //MARK: Public Methotds

    func updateArray(_ count: Int) {
        arrayOffsets = Array(repeating: 0, count: count)
    }
    
    func updateXValue(_ index: Int,_ value: CGFloat) {
        arrayOffsets[index] = value
    }
    
    //MARK: Private Methotds

    private func getTabsData() {
        tabs = [
            TabModel(1, "First", .red),
            TabModel(2, "Second", .orange),
            TabModel(3, "Third", .yellow),
            TabModel(4, "Fourth", .green),
            TabModel(5, "Fifth", .mint),
            TabModel(6, "Sixth", .teal),
            TabModel(7, "Seventh", .cyan),
            TabModel(8, "Eighth", .blue),
            TabModel(9, "Ninth", .indigo),
            TabModel(10, "Tenth", .purple),
            TabModel(11, "Eleventh", .pink),
            TabModel(12, "Twelfth", .brown)
        ]
    }
}
