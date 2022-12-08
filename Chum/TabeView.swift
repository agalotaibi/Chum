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
                Discover()
                    
                    .navigationBarTitleDisplayMode(.inline)
                // .navigationBarHidden(true)
            }
            .tabItem { Text("Discover")
                
                Image(systemName: "doc.text.image.fill") }
            .tag(1)
            
            //feedbage
            NavigationView{
                CreateEv()
                    
                    .navigationBarTitleDisplayMode(.inline)
                // .navigationBarHidden(true)
            }
            .tabItem { Text("Profile")
                Image(systemName: "person.circle.fill")
               
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
