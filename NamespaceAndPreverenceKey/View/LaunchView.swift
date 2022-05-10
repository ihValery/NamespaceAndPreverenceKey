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
            ScrollView(.vertical, showsIndicators: false) {
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
                    
                    NavigationLink {
                        MGEOneView()
                    } label: {
                        oneLink("Matched Geometry Effect")
                    }
                    
                    NavigationLink {
                        MGETwoView()
                    } label: {
                        oneLink("Matched Geometry Effect 2")
                    }
                    
                    NavigationLink {
                        AnchorPoint()
                    } label: {
                        oneLink("Anchor Point")
                    }
                    
                    NavigationLink {
                        MultipleGroups()
                    } label: {
                        oneLink("Multiple Groups, with Multiple Views")
                    }
                    
                    NavigationLink {
                        MultipleNamespaces()
                    } label: {
                        oneLink("Multiple Namespaces")
                    }
                    
                    NavigationLink {
                        ColorNamespace()
                    } label: {
                        oneLink("Color Namespace")
                    }
                }
                .drawingGroup()
                .defaultShadow(.purple.opacity(0.2))
            }
            .navigationBarHidden(true)
        }
    }
    
    //MARK: Private Methods
    
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
