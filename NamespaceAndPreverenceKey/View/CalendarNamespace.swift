//
//  CalendarNamespace.swift
//  NamespaceAndPreverenceKey
//
//  Created by Валерий Игнатьев on 10.05.22.
//

import SwiftUI

//MARK: - CalendarNamespace

struct CalendarNamespace: View {
    
    //MARK: Properties
    
    @ObservedObject private var tabViewModel = TabBarVM()

    var body: some View {
        VStack(spacing: 30) {
            ForEach(0..<4) { (rows: Int) in
                HStack(spacing: 30) {
                    ForEach(1..<4) { (col: Int) in
                        Text("\(tabViewModel.tabs[rows * 3 + col - 1].name)")
                    }
                }
            }
        }
    }
    
    //MARK: Private Methods

    private func 
}

//MARK: - PreviewProvider

struct CalendarNamespace_Previews: PreviewProvider {
    static var previews: some View {
        CalendarNamespace()
            .preferredColorScheme(.dark)
    }
}
