//
//  NamespaceView.swift
//  NamespaceAndPreverenceKey
//
//  Created by Валерий Игнатьев on 5.05.22.
//

import SwiftUI

//MARK: - NamespaceView

struct NamespaceView: View {
    
    //MARK: Properties
    
    @ObservedObject private var tabBarViewModel = TabBarVM()
    
    @State private var selectTab: Tab = .first
    
    @Namespace var buttonSpace
    
    @State private var twoColor: [Color] = [.red, .clear]
    
    @State private var isSideZero: Bool = true
    
    @State private var rotationDegrees: Double = 0
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 10) {
                ForEach(tabBarViewModel.tabs) { item in
                    OneButton(item,
                              buttonSpace,
                              $selectTab,
                              $isSideZero,
                              $twoColor,
                              $rotationDegrees)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .offset(x: -15)
            }
        }
        .background(
            FullCircleView(twoColor, rotationDegrees)
                .offset(x: UIScreen.main.bounds.width / 2)
        )
        .navigationBarTitleDisplayMode(.inline)
    }
    
    //MARK: Private Methotds
    
    private func getColor() -> Color {
        tabBarViewModel.getColor(selectTab)
    }
}

//MARK: - PreviewProvider

struct NamespaceView_Previews: PreviewProvider {
    static var previews: some View {
        NamespaceView()
    }
}

//MARK: - OneButton

struct OneButton: View {
    
    //MARK: Properties
    
    @Binding private var selectTab: Tab
    
    @Binding private var isSideZero: Bool
    
    @Binding private var twoColor: [Color]
    
    @Binding private var rotationDegrees: Double
    
    private let tabItem: TabModel
    
    private var buttonSpace: Namespace.ID
    
    var body: some View {
        Button {
            tapButton()
        } label: {
            Text(tabItem.name)
                .font(.title3)
                .fontWeight(.medium)
                .foregroundColor(selectTab == tabItem.tab ? .white : tabItem.color)
                .padding(.vertical)
                .padding(.leading, 30)
                .background(Color.clear)
                .frame(width: 150, alignment: .leading)
                .background(backgrounSelect())
        }
    }
    
    //MARK: Initializer
    
    init(_ tabItem: TabModel,
         _ buttonSpace: Namespace.ID,
         _ selectTab: Binding<Tab>,
         _ isSideZero: Binding<Bool>,
         _ twoColor: Binding<[Color]>,
         _ rotationDegrees: Binding<Double>) {
        
        self.tabItem = tabItem
        self.buttonSpace = buttonSpace
        self._selectTab = selectTab
        self._isSideZero = isSideZero
        self._twoColor = twoColor
        self._rotationDegrees = rotationDegrees
    }
    
    //MARK: Private Methotds
    
    private func tapButton() {
        guard selectTab != tabItem.tab else { return }
        
        withAnimation(.spring(response: 0.4, dampingFraction: 0.7)) {
            clockwise()
            selectTab = tabItem.tab
            fillHalfCircle()
            isSideZero.toggle()
        }
    }
    
    private func fillHalfCircle() {
        if isSideZero {
            twoColor[1] = tabItem.color
        } else {
            twoColor[0] = tabItem.color
        }
    }
    
    private func clockwise() {
        if selectTab.id > tabItem.tab.id {
            rotationDegrees += 180
        } else {
            rotationDegrees -= 180
        }
    }
    
    @ViewBuilder private func backgrounSelect() -> some View {
        if selectTab == tabItem.tab {
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(tabItem.color)
                .defaultShadow(tabItem.color)
                .matchedGeometryEffect(id: "buttonSpace", in: buttonSpace)
        }
    }
}
