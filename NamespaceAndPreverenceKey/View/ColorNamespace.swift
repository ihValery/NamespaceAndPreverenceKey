//
//  ColorNamespace.swift
//  NamespaceAndPreverenceKey
//
//  Created by Валерий Игнатьев on 10.05.22.
//

import SwiftUI

//MARK: - ColorNamespace

struct ColorNamespace: View {

    //MARK: Properties

    @ObservedObject private var colorViewModel = ColorVM()

    @State private var selectColor: ColorModel = .init(.red)

    @Namespace private var colorNs

    private let columns: [GridItem] = Array(repeating: GridItem(), count: 3)

    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(colorViewModel.colors) { item in
                oneItem(item)
            }
        }
    }

    //MARK: Private Methods

    private func oneItem(_ item: ColorModel) -> some View {
        Button {
            withAnimation(.spring(response: 0.3, dampingFraction: 0.6)) {
                selectColor = item
            }
        } label: {
            Text(item.name)
                .foregroundColor(foregroundSelectColor(item))
                .font(.title2)
                .fontWeight(.medium)
                .padding()
                .background(backgroundSelectColor(item))
                .overlay(overlaySelectColor(item))
        }
        .frame(height: 100)
        .matchedGeometryEffect(id: item.id, in: colorNs)
    }

    @ViewBuilder private func foregroundSelectColor(_ item: ColorModel) -> Color {
        selectColor.color == item.color ? .white : item.color
    }

    @ViewBuilder private func backgroundSelectColor(_ item: ColorModel) -> some View {
        if selectColor.color == item.color {
            RoundedRectangle(cornerRadius: 13, style: .continuous)
                .fill(item.color)
                .opacity(0.4)
                .defaultShadow(item.color)
                .matchedGeometryEffect(id: "color", in: colorNs)
        }
    }

    @ViewBuilder private func overlaySelectColor(_ item: ColorModel) -> some View {
        if selectColor.color == item.color {
            RoundedRectangle(cornerRadius: 13, style: .continuous)
                .stroke(item.color)
                .matchedGeometryEffect(id: "color", in: colorNs)
        }
    }
}

//MARK: - PreviewProvider

struct CalendarNamespace_Previews: PreviewProvider {
    static var previews: some View {
        ColorNamespace()
//            .preferredColorScheme(.dark)
    }
}
