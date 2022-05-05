//
//  PreferenceKeyView.swift
//  NamespaceAndPreverenceKey
//
//  Created by Валерий Игнатьев on 5.05.22.
//

import SwiftUI

//MARK: - PreferenceKeyView

struct PreferenceKeyView: View {
    
    //MARK: Properties
    
    @ObservedObject private var viewModel = TabBarVM()
    
    @State private var selectTab = TabBarVM().tabs.first!
    
    @State private var sizeOneTab: CGSize = .zero
    
    @State private var selectedOffset: CGFloat = 0
    
    @State private var countTab: Int = 1 {
        didSet {
            viewModel.updateArray(countTab)
        }
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            
            VStack(spacing: 20) {
                textDefault()
                
                buttonPlusMinus()
            }
            .padding(.bottom, 130)
            
            tabBarPanel()
        }
        .background(Color.black)
    }
    
    //MARK: Private Methotds
    
    private func tabBarPanel() -> some View {
        HStack(spacing: .zero) {
            ForEach(viewModel.tabs.prefix(countTab)) { item in
                GeometryReader { geometry in
                    let offset = geometry.frame(in: .global).minX
                    
                    oneTabButton(item)
                        .preference(key: OffsetTabPreferenceKey.self, value: offset)
                        .onPreferenceChange(OffsetTabPreferenceKey.self, perform: { value in
                            viewModel.updateXValue(item.number - 1, value)
                            if selectTab.id == item.id {
                                selectedOffset = viewModel.arrayOffsets[item.number - 1]
                            }
                        })
                    
                        .preference(key: SizeOneTabPreferenceKey.self, value: geometry.size)
                        .onPreferenceChange(SizeOneTabPreferenceKey.self) { value in
                            sizeOneTab = value
                        }
                }
                .frame(height: 100)
            }
        }
        .background(.ultraThinMaterial)
        .background(
            Circle().fill(selectTab.color)
                .offset(x: selectedOffset)
                .frame(width: sizeOneTab.width)
                .frame(maxWidth: .infinity, alignment: .leading)
                .animation(.spring(response: 0.3, dampingFraction: 0.7), value: selectTab.id)
        )
        .overlay(
            Rectangle()
                .fill(selectTab.color).frame(width: 30, height: 5).cornerRadius(3)
                .frame(width: sizeOneTab.width)
                .offset(x: selectedOffset)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .animation(.spring(response: 0.3, dampingFraction: 0.7), value: selectTab.id)
        )
        .cornerRadius(30)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .ignoresSafeArea()
    }
    
    private func oneTabButton(_ item: TabModel) -> some View {
        Button {
            selectTab = item
            selectedOffset = viewModel.arrayOffsets[item.number - 1]
        } label: {
            Text("\(item.number)")
                .font(.largeTitle.bold())
                .padding(.top, 20)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                .foregroundColor(selectTab.id == item.id ? .white : .secondary)
        }
    }
    
    private func buttonPlusMinus() -> some View {
        HStack(spacing: 20) {
            Button {
                guard countTab != 1 else { return }
                
                countTab -= 1
                
                if selectTab.number > countTab {
                    selectedOffset = viewModel.arrayOffsets[countTab - 1]
                    selectTab = viewModel.tabs[countTab - 1]
                }
            } label: {
                Text("-")
            }
            
            Text("\(countTab)")
                .bold()
            
            Button {
                guard countTab != viewModel.tabs.count else { return }
                
                countTab += 1
            } label: {
                Text("+")
            }
        }
        .font(.largeTitle)
        .foregroundColor(.white)
        .padding()
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30,
                                                             style: .continuous))
    }
    
    private func textDefault() -> some View {
        VStack(alignment: .leading, spacing: 10) {
            defaultText("\(selectTab.name) offset: \(String(format: "%.2f", selectedOffset))")
            
            arrayOffsets()
            
            defaultText("WidthTab: \(String(format: "%.2f", sizeOneTab.width))")
        }
        .frame(maxWidth: .infinity, alignment: .center)
    }
    
    private func arrayOffsets() -> some View {
        HStack(spacing: 10) {
            defaultText("ArrayOffsets =")
            
            VStack(alignment: .leading, spacing: 0) {
                ForEach(viewModel.arrayOffsets, id: \.self) { item in
                    Text("\(String(format: "%.2f", item))")
                        .font(.title3)
                        .foregroundColor(selectedOffset == item ? selectTab.color : .gray)
                }
            }
        }
    }
    
    private func defaultText(_ text: String) -> some View {
        Text(text)
            .foregroundColor(.white)
            .font(.footnote)
    }
}

//MARK: - PreviewProvider

struct PreferenceKeyView_Previews: PreviewProvider {
    static var previews: some View {
        PreferenceKeyView()
            .previewInterfaceOrientation(.portrait)
    }
}

//MARK: - PreferenceKey

struct SizeOneTabPreferenceKey: PreferenceKey {
    static var defaultValue: CGSize = .zero
    
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        value = nextValue()
    }
}

struct OffsetTabPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = .zero
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
