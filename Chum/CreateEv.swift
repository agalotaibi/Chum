//
//  CreateEv.swift
//  Chum
//
//  Created by Amaal on 13/05/1444 AH.
//

import SwiftUI

struct CreateEv: View {
    @State var Name:String = ""
    @State var noFriends: Int = 1
    var body: some View {
        NavigationView{
            ScrollView(.vertical,showsIndicators: false){
                VStack{
                    Text("Event Name").frame(maxWidth: 300, alignment: .leading)
                    TextField("", text: $Name).frame(width: 300, height: 50.0, alignment: .leading)
                        .overlay(RoundedRectangle(cornerRadius: 10)
                            .stroke(.gray, lineWidth:1)).padding(.bottom)
                    Text("Event Location").frame(maxWidth: 300, alignment: .leading)
                    TextField("", text: $Name).frame(width: 300, height: 50.0, alignment: .leading)
                        .overlay(RoundedRectangle(cornerRadius: 10)
                            .stroke(.gray, lineWidth:1)).padding(.bottom)
                    Text("Chose Your icon").frame(maxWidth: 300, alignment: .leading)
                    ScrollView(.horizontal){
                        HStack{
                            Image(systemName: "pencil").padding()
                            Image(systemName: "scribble.variable").padding()
                            Image(systemName: "pencil.tip").padding()
                            Image(systemName: "paperplane.circle").padding()
                            Image(systemName: "doc.append").padding()
                            Image(systemName: "graduationcap").padding()
                            Image(systemName: "pencil.and.ruler").padding()
                        }.padding().imageScale(.large)}
                    Text("Number of Friends").frame(maxWidth: 300, alignment: .leading)
                    
                    HStack{
                        Text("\(noFriends)").frame(maxWidth: 300, alignment: .leading)
                        
                        Stepper("", value: $noFriends, in: 0...20,step:1)
                        
                    }.frame(maxWidth: 300, alignment: .leading).padding(.bottom)
                    
                    VStack{
                        Text("Date and Time").frame(maxWidth: 300, alignment: .leading)
                        
                        DatePicker(selection: /*@START_MENU_TOKEN@*/.constant(Date())/*@END_MENU_TOKEN@*/, label: { Text("Date and Time") }).frame(maxWidth: 300, alignment: .center).labelsHidden().datePickerStyle(WheelDatePickerStyle())
                        
                        NavigationLink{
                            
                            Discover().navigationBarBackButtonHidden(true)
                        }
                        
                    label:{Text("Done")
                            .padding()
                            .frame(maxWidth: 180)
                            .font(.callout)
                            .foregroundColor(.white)
                            .background(Color("Prime"))
                        .cornerRadius(12)}
                        
                        
                    }
                    
                    
                }
            }
        }
    }
    
}
    struct CreateEv_Previews: PreviewProvider {
        static var previews: some View {
            CreateEv()
        }
    }
    
    
    

