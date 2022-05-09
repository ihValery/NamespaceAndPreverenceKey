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
    
    func getColor(_ tab: Tab) -> Color {
        tabs.first { $0.tab == tab }?.color ?? .black
    }
    
    //MARK: Private Methotds

    private func getTabsData() {
        tabs = [
            TabModel(1, .red, .first),
            TabModel(2, .orange, .second),
            TabModel(3, .yellow, .third),
            TabModel(4, .green, .fourth),
            TabModel(5, .mint, .fifth),
            TabModel(6, .teal, .sixth),
            TabModel(7, .cyan, .seventh),
            TabModel(8, .blue, .eighth),
            TabModel(9, .indigo, .ninth),
            TabModel(10, .purple, .tenth),
            TabModel(11, .pink, .eleventh),
            TabModel(12, .brown, .twelfth)
        ]
    }
}
