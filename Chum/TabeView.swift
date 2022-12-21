//
//  TabeView.swift
//  Chum
//
//  Created by Amaal on 13/05/1444 AH.
//

import SwiftUI

struct TabeView: View {
    @AppStorage("key") var shouldShow = true
    var body: some View {
        
            VStack{
                
                NavigationView{
                    
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
                            Profile()
                            
                                .navigationBarTitleDisplayMode(.inline)
                            // .navigationBarHidden(true)
                        }
                        .tabItem { Text("Profile")
                            Image(systemName: "person.circle.fill")
                            
                        }
                        .tag(2)
                        
                    }.onAppear {
                        // correct the transparency bug for Tab bars
                        let tabBarAppearance = UITabBarAppearance()
                        tabBarAppearance.configureWithOpaqueBackground()
                        UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
                        // correct the transparency bug for Navigation bars
                        let navigationBarAppearance = UINavigationBarAppearance()
                        navigationBarAppearance.configureWithOpaqueBackground()
                        UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
                    }
                    
                    
                }
                
            }
            .fullScreenCover(isPresented: $shouldShow) {
                Onbording(shouldShow: $shouldShow)
            }
        
    }
}

struct TabeView_Previews: PreviewProvider {
    static var previews: some View {
        TabeView()
    }
}
