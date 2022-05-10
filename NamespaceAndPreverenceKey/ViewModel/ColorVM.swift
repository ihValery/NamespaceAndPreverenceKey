//
//  ColorVM.swift
//  NamespaceAndPreverenceKey
//
//  Created by Валерий Игнатьев on 10.05.22.
//

import SwiftUI

//MARK: - ColorVM

final class ColorVM: ObservableObject {
    
    @Published var colors: [ColorModel] = []
    
    //MARK: Initializer
    
    init() {
        getColorsData()
    }
    
    //MARK: Private Methods

    private func getColorsData() {
        colors = [
            ColorModel(.red),
            ColorModel(.orange),
            ColorModel(.yellow),
            ColorModel(.green),
            ColorModel(.mint),
            ColorModel(.teal),
            ColorModel(.cyan),
            ColorModel(.blue),
            ColorModel(.indigo),
            ColorModel(.purple),
            ColorModel(.pink),
            ColorModel(.brown)
        ]
    }
}
