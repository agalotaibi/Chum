//
//  TabeView.swift
//  Chum
//
//  Created by Amaal on 13/05/1444 AH.
//

import SwiftUI

struct TabeView: View {
    var body: some View {
        TabView(selection: .constant(1)) {
            NavigationView{
                Discover() .navigationBarHidden(true)
            }
            .tabItem { Text("Discover")
                
                Image(systemName: "doc.text.image.fill") }
            .tag(1)
            
            //feedbage
            NavigationView{
                CreateEv()
            }
            .tabItem { Text("create")
                
                Image(systemName: "person.3")
            }
            .tag(2)
            
        }
    }
}

struct TabeView_Previews: PreviewProvider {
    static var previews: some View {
        TabeView()
    }
}
