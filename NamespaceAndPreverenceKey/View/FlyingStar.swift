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
        static let heightTitle: CGFloat = 90
        static let offsetDueToBlur: CGFloat = 20
        static let columns: [GridItem] = Array(repeating: GridItem(), count: 2)
    }
    
    //MARK: Properties
    
    @ObservedObject private var colorViewModel = ColorVM()

    var body: some View {
        ZStack(alignment: .top) {
            favoritePanel()
            
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: InternalConstant.columns) {
                    ForEach(colorViewModel.colors) { item in
                        RoundedRectangle(cornerRadius: 13, style: .continuous)
                            .fill(item.color.opacity(0.4))
                            .frame(height: 200)
                            .overlay(
                                Text("\(item.name)")
                                    .foregroundColor(.white)
                                    .font(.title)
                                    .fontWeight(.medium)
                                    .padding(.bottom)
                                , alignment: .bottom
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 13, style: .continuous)
                                    .stroke(item.color)
                            )
//                            .background(Color.white)
//                            .cornerRadius(13)
                            .defaultShadow(item.color)
                            .padding(8)
                    }
                }
                .padding([.top, .horizontal, .bottom])
                .padding(.top, InternalConstant.heightTitle)
            }
//            .background(.red)
            
            Spacer()
        }
//        .background(.ultraThinMaterial)
        .ignoresSafeArea()
        .navigationBarHidden(true)
    }
    
    //MARK: Private Methods
    
    private func favoritePanel() -> some View {
        Color.clear
            .frame(height: InternalConstant.heightTitle + InternalConstant.offsetDueToBlur)
            .background(.ultraThinMaterial)
            .blur(radius: 10)
            .overlay(headerFavoritePanel())
            .offset(y: -InternalConstant.offsetDueToBlur)
            .zIndex(1)
    }
    
    private func headerFavoritePanel() -> some View {
        HStack {
            Text("Favorite")
                .font(.title)
                .fontWeight(.medium)
                .foregroundColor(.white)
                .defaultShadow(.gray)
            
            Spacer()
            
            Circle()
                .fill(.purple)
                .frame(width: 30, height: 30)
        }
        .padding(.horizontal, 32)
        .frame(maxHeight: .infinity, alignment: .bottom)
        .padding(.bottom)
    }
}

//MARK: - PreviewProvider

struct FlyingStar_Previews: PreviewProvider {
    static var previews: some View {
        FlyingStar()
    }
}
