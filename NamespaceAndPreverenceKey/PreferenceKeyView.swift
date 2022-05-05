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
    
    @State private var sizeText: CGFloat = .zero
    
    @State private var selectedX: CGFloat = 0
    
    @State private var countTab: Int = 1 {
        didSet {
            viewModel.updateArray(countTab)
        }
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Color.black
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                textDefault()
                
                HStack(spacing: 20) {
                    Button {
                        guard countTab != 1 else { return }
                        
                        countTab -= 1
                        
                        if selectTab.number > countTab {
                            selectedX = viewModel.x[countTab - 1]
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
            .padding(.bottom, 130)
            
            HStack(spacing: .zero) {
                ForEach(viewModel.tabs.prefix(countTab)) { item in
                    GeometryReader { geometry in
                        let offset = geometry.frame(in: .global).minX
                        
                        Button {
                            selectTab = item
                            selectedX = viewModel.x[item.number - 1]
                        } label: {
                            Text("\(item.number)")
                                .font(.largeTitle.bold())
                                .padding(.top, 20)
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                                .foregroundColor(selectTab.id == item.id ? .white : .secondary)
                        }
                        .preference(key: OffsetTabPreferenceKey.self, value: offset)
                        .onPreferenceChange(OffsetTabPreferenceKey.self, perform: { value in
                            viewModel.updateXValue(item.number - 1, value)
                            if selectTab.id == item.id {
                                selectedX = viewModel.x[item.number - 1]
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
                    .offset(x: selectedX)
                    .frame(width: sizeOneTab.width)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .animation(.spring(response: 0.3, dampingFraction: 0.7), value: selectTab.id)
            )
            .overlay(
                Rectangle()
                    .fill(selectTab.color).frame(width: 30, height: 5).cornerRadius(3)
                    .frame(width: sizeOneTab.width)
                    .offset(x: selectedX)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                    .animation(.spring(response: 0.3, dampingFraction: 0.7), value: selectTab.id)
            )
            .cornerRadius(30)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
            .ignoresSafeArea()
        }
    }
    
    private func textDefault() -> some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("SelectX: \(String(format: "%.2f", selectedX))")
                .foregroundColor(.white)
                .font(.title.bold())
                .background(
                    GeometryReader { geometry in
                        Color.clear
                            .preference(key: SizeTextPreferenceKey.self,
                                        value: geometry.size.width)
                            .onPreferenceChange(SizeTextPreferenceKey.self) { value in
                                sizeText = value
                            }
                    }
            )

            HStack(spacing: 10) {
                Text("array x = ")
                    .foregroundColor(.gray)
                
                VStack(alignment: .leading, spacing: 0) {
                    ForEach(viewModel.x, id: \.self) { item in
                        Text("\(String(format: "%.2f", item))")
                            .font(.title3)
                            .foregroundColor(selectedX == item ? selectTab.color : .gray)
                    }
                }
            }

            HStack {
                VStack(spacing: 2) {
                    Text("Width: \(String(format: "%.2f", sizeOneTab.width))")
                        .foregroundColor(.white)
                        .font(.footnote)
                }
                
                VStack(spacing: 2) {
                    Text("Height: \(String(format: "%.2f", sizeOneTab.height))")
                        .foregroundColor(.white)
                        .font(.footnote)
                }
            }
            Rectangle()
                .fill(selectTab.color)
                .frame(height: 2)
                .cornerRadius(3)
                .frame(width: sizeText)
        }
        .frame(maxWidth: .infinity, alignment: .center)
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

struct SizeTextPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = .zero
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
