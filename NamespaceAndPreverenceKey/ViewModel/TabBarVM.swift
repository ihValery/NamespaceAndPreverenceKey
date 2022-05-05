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
            TabModel(1, .red),
            TabModel(2, .orange),
            TabModel(3, .yellow),
            TabModel(4, .green),
            TabModel(5, .mint),
            TabModel(6, .teal),
            TabModel(7, .cyan),
            TabModel(8, .blue),
            TabModel(9, .indigo),
            TabModel(10, .purple),
            TabModel(11, .pink),
            TabModel(12, .brown)
        ]
    }
}
