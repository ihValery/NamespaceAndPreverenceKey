//
//  MatchedGeometryEffectView.swift
//  NamespaceAndPreverenceKey
//
//  Created by Валерий Игнатьев on 7.05.22.
//

import SwiftUI

//MARK: - MatchedGeometryEffectView

struct MatchedGeometryEffectView: View {
    @State private var flag: Bool = true
    
    var body: some View {
        HStack {
            if flag {
                Rectangle().fill(Color.green).frame(width: 100, height: 100)
            }
            
            Spacer()
            
            
            Spacer()
            
            if !flag {
                Circle().fill(Color.blue).frame(width: 50, height: 50)
            }
        }.frame(width: 400)
    }
    
    //MARK: Private Methotds

    private func buttonSwitch() -> some View {
        Button {
            flag.toggle()
        } label: {
            Text("Switch")
                .foregroundColor(.primary)
                .font(.title3)
                .fontWeight(.medium)
        }
    }
}

//MARK: - PreviewProvider

struct MatchedGeometryEffectView_Previews: PreviewProvider {
    static var previews: some View {
        MatchedGeometryEffectView()
    }
}
