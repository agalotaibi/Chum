//
//  Onbording.swift
//  Chum
//
//  Created by Amaal on 13/05/1444 AH.
//

import SwiftUI

struct Onbording: View {
    @State private var selectedTab = 1
    @Binding  var shouldShow :Bool
    var body: some View {
        NavigationView{
            
            //  VStack {
            TabView(selection: $selectedTab){
                
                VStack(){
                    
                    Image("FriendsOn").resizable().aspectRatio(contentMode: .fit)
                        .frame(width: 250).padding().padding(.top)
                    
                    Text("Welcome to  ")
                        .font(.system(size: 46)).frame(maxWidth: 300, alignment: .leading)
                    Text("Chum")
                        .font(.system(size: 46))
                        .fontWeight(.bold).frame(maxWidth: 300, alignment: .leading).padding(.bottom)
                    
                    Text("A place to engage with your friends and do your activities together ")
                        .font(.system(size: 20))
                        .frame(maxWidth: 300, alignment: .leading)
                    Spacer()
                } .tag(1)
                
                
                
                VStack{
                    Image("StutusOn").resizable().aspectRatio(contentMode: .fit)
                        .frame(width: 300).padding()
                    
                    Spacer()
                    
                    Text("Share your")
                        .font(.system(size: 46)).frame(maxWidth: 300, alignment: .leading)
                    Text("Status")
                        .font(.system(size: 46))
                        .fontWeight(.bold).frame(maxWidth: 300, alignment: .leading).padding(.bottom)
                    
                    Text("Share What you plan to do and ask them to join ")
                        .font(.system(size: 20))
                        .frame(maxWidth: 300, alignment: .leading)
                    
                    Spacer()
                    
                    Button(action: {
                        shouldShow = false
                    },
                    
                label:{Text("Done")
                        .padding()
                        .frame(maxWidth: 180)
                        .font(.callout)
                        .foregroundColor(.white).background(Color("Prime"))
                    .cornerRadius(12)})
                    
                    Spacer()
                    
                    
                    
                    
                }.tag(2)
                
            }
            .frame(width: .infinity, height: .infinity)
            .tabViewStyle(PageTabViewStyle()).indexViewStyle(.page(backgroundDisplayMode: .always))
            
        }
                  }
              
      }
  


//struct Onbording_Previews: PreviewProvider {
//    static var previews: some View {
//        Onbording()
//    }
//}
