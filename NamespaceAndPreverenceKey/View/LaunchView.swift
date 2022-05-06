//
//  LaunchView.swift
//  NamespaceAndPreverenceKey
//
//  Created by Валерий Игнатьев on 6.05.22.
//

import SwiftUI

//MARK: - LaunchView

struct LaunchView: View {
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 10) {
                NavigationLink {
                    PreferenceKeyView()
                } label: {
                    oneLink("Preference Key")
                }
                
                NavigationLink {
                    NamespaceView()
                } label: {
                    oneLink("Namespace")
                }
            }
        }
    }
    
    //MARK: Private Methotds

    private func oneLink(_ text: String) -> some View {
        Text(text)
            .font(.title3)
            .fontWeight(.medium)
            .foregroundColor(.white)
            .padding(.vertical)
            .padding(.horizontal, 30)
            .background(Color.clear)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .fill(.purple)
                    .defaultShadow(.purple)
            )
            .padding(.horizontal, 30)
    }
}

//MARK: - PreviewProvider

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
