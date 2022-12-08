//
//  Discover.swift
//  Chum
//
//  Created by Amaal on 13/05/1444 AH.
//

import SwiftUI

struct Discover: View {
    var body: some View {
        NavigationView{
            
            VStack{
                HStack{
                    Text("Discover")
                        .font(.largeTitle)
                    Spacer()
                    NavigationLink{
                        CreateEv()
                    }label: {
                        Image(systemName: "plus")
                            .imageScale(.large)
                    }
                    
                    
                }.padding()
                
                List {
                    
                    ForEach(0..<5) { i in
                        Section {
                            Text("A new row \(i)")
                        }
                    }
                    
                }.listStyle(InsetGroupedListStyle())
            }
            
            
            
            
        }
    }
    
}




struct Discover_Previews: PreviewProvider {
    static var previews: some View {
        Discover()
    }
}
