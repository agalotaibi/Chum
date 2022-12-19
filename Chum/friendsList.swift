//
//  friendsList.swift
//  Chum
//
//  Created by Amaal on 25/05/1444 AH.
//

import SwiftUI

struct friendsList: View {
    static let GrayRow = Color("GrayRow")
        static let Prime = Color("Prime")
       
        @State var friends: [String] = ["Atheer", "Sara","Asma","Nora", "Sultan", "Reema" , "Abdullah"]
       
        
    var body: some View {
     
    VStack {
      

            HStack{
                Text("Friends")
                    .font(.largeTitle)
                Spacer()
               
                    Image(systemName: "plus")
                        .imageScale(.large)
                
                
                
            }.padding()
            
          

        // List here . . .
        List {
      
            ForEach(friends, id: \.self) { friend in
               
        // Rows . . .
                Text(friend)
                  .frame(height: 40)
//                  .foregroundColor(.white)
                 
//                  .listRowBackground(Color.black) // CHANGE IN CASE OF LIGHT MODE
//                  .listRowSeparatorTint(Color("GrayRow"))
//
                
        // Swipe to delete here . . .
                .swipeActions(allowsFullSwipe: true) {
                      Button(action: {
                      guard let index = self.friends.firstIndex(of: friend)
                      else { return }
                      self.friends.remove(at: index)
                      }) {
                          Image(systemName: "xmark")
                      }
                     
                      .tint(Color("Prime"))
                } // End of swipeActions
     
             } // End of ForEach
     
         } // End of List
//         .background(.black) // CHANGE IN CASE OF LIGHT MODE
//         .scrollContentBackground(.hidden)
//
       
        
       } // End of VStack
//       .background(.black) // CHANGE IN CASE OF LIGHT MODE
       
     } // End View
        
        
        
     
       
    } // End of struct
     

struct friendsList_Previews: PreviewProvider {
    static var previews: some View {
        friendsList()
    }
}
