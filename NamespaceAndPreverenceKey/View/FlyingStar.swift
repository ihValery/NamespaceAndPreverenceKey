//
//  FlyingStar.swift
//  NamespaceAndPreverenceKey
//
//  Created by Валерий Игнатьев on 10.05.22.
//

import SwiftUI

//MARK: - FlyingStar

struct FlyingStar: View {
    
    //MARK: Internal Constant
    
    struct InternalConstant {
        static let heightHeader: CGFloat = 90
        static let heightCard: CGFloat = 200
        static let offsetDueToBlur: CGFloat = 20
        static let corner: CGFloat = 13
        static let columns: [GridItem] = Array(repeating: GridItem(), count: 2)
    }
    
    //MARK: Properties
    
    @ObservedObject private var colorViewModel = ColorVM()
    
    @Namespace private var colorNs
    
    @State private var isFlag: Bool = false
    
    var body: some View {
        ZStack(alignment: .top) {
            favoritePanel()
            
            ScrollView(.vertical, showsIndicators: false) {
                oneCard(colorViewModel.colors.first!)
                    .onTapGesture {
                        isFlag.toggle()
                    }
                
                
//                LazyVGrid(columns: InternalConstant.columns) {
//                    ForEach(colorViewModel.colors) { item in
//                    }
//                }
                .padding([.top, .horizontal, .bottom])
                .padding(.top, InternalConstant.heightHeader)
            }
            
            Spacer()
        }
        .animation(.linear(duration: 2), value: isFlag)
        .ignoresSafeArea()
        .navigationBarHidden(true)
    }
    
    //MARK: Private Methods
    
    private func oneCard(_ item: ColorModel) -> some View {
        VStack {
            defaultText(item.name)
                .padding(.bottom)
        }
        .frame(maxWidth: .infinity)
        .frame(height: InternalConstant.heightCard, alignment: .bottom)
        .overlay(
            RoundedRectangle(cornerRadius: InternalConstant.corner, style: .continuous)
                .stroke(item.color)
        )
        .background(
            RoundedRectangle(cornerRadius: InternalConstant.corner, style: .continuous)
                .fill(item.color)
                .matchedGeometryEffect(id: "card", in: colorNs)
        )
        .defaultShadow(item.color)

    }
    
    private func favoritePanel() -> some View {
        Color.clear
            .frame(height: InternalConstant.heightHeader + InternalConstant.offsetDueToBlur)
            .background(.ultraThinMaterial)
            .blur(radius: 10)
            .overlay(headerFavoritePanel())
            .offset(y: -InternalConstant.offsetDueToBlur)
            .zIndex(1)
    }
    
    private func headerFavoritePanel() -> some View {
        HStack {
            defaultText("Favorite")
                .defaultShadow(.gray)
            
            Spacer()
            
            Circle()
                .fill(.red)
                .overlay(
                    Circle()
                        .stroke(.red)
                )
                .matchedGeometryEffect(id: isFlag ? "card" : "empty",
                                       in: colorNs,
                                       isSource: false)
                .frame(width: 30, height: 30)
                .shadow(color: .red, radius: 3, x: 0, y: 0)
        }
        .padding(.horizontal, 32)
        .frame(maxHeight: .infinity, alignment: .bottom)
        .padding(.bottom)
    }
    
    private func defaultText(_ text: String) -> some View {
        Text(text)
            .font(.title)
            .fontWeight(.medium)
            .foregroundColor(.white)
    }
}

//MARK: - PreviewProvider

struct FlyingStar_Previews: PreviewProvider {
    static var previews: some View {
        FlyingStar()
    }
}
