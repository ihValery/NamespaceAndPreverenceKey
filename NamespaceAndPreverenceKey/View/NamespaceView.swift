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
    
    @AppStorage("selectTab") private var selectTab: Tab = .first
    
    @Namespace var buttonSpace

    var body: some View {
        VStack {
            ForEach(tabBarViewModel.tabs) { item in
                OneButton(item, buttonSpace, $selectTab)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .offset(x: -15)
        .ignoresSafeArea()
        .background(BackgroundCircle(getColor()))
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

//MARK: - BackgroundCircle

struct BackgroundCircle: View {
    
    //MARK: Properties
    
    private let color: Color

    var body: some View {
        Circle()
            .fill(color)
            .frame(width: UIScreen.main.bounds.height,
                   height: UIScreen.main.bounds.height)
            .shadow(color: color, radius: 20, x: 0, y: 0)
            .offset(x: UIScreen.main.bounds.height / 2.3)
    }
    
    //MARK: Initializer
    
    init(_ color: Color) {
        self.color = color
    }
}

//MARK: - OneButton

struct OneButton: View {
    
    //MARK: Properties
    
    @Binding var selectTab: Tab

    private let tabItem: TabModel

    private var buttonSpace: Namespace.ID
    
    var body: some View {
        Button {
            withAnimation(.default) {
                selectTab = tabItem.tab                
            }
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
    
    init(_ tabItem: TabModel,_ buttonSpace: Namespace.ID,_ selectTab: Binding<Tab>) {
        self.tabItem = tabItem
        self.buttonSpace = buttonSpace
        self._selectTab = selectTab
    }
    
    //MARK: Private Methotds

    @ViewBuilder private func backgrounSelect() -> some View {
        if selectTab == tabItem.tab {
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(tabItem.color)
                .shadow(color: tabItem.color, radius: 10, x: 0, y: 0)
                .matchedGeometryEffect(id: "buttonSpace", in: buttonSpace)
        }
    }
}
