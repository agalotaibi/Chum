//
//  CreateEv.swift
//  Chum
//
//  Created by Amaal on 13/05/1444 AH.
//

import SwiftUI
import CloudKit


struct CreateEv: View {
    @State var Name:String = ""
    @State var noFrinds: Int = 1
    @Environment(\.presentationMode) var presentationMode
    @State var eventName = ""
    @State var EventLocation = ""
    @State var eventEmoji = ""
    @State var dateTime = Date.now
    
    
    var body: some View {
        VStack{
            NavigationView{
                ScrollView(.vertical,showsIndicators: false){
                    VStack{
                        Text("Event Name").frame(maxWidth: 300, alignment: .leading)
                        TextField("", text: $eventName).frame(width: 300, height: 50.0, alignment: .leading)
                            .overlay(RoundedRectangle(cornerRadius: 10)
                                .stroke(.gray, lineWidth:1)).padding(.bottom)
                        Text("Event Location").frame(maxWidth: 300, alignment: .leading)
                        TextField("", text: $EventLocation).frame(width: 300, height: 50.0, alignment: .leading)
                            .overlay(RoundedRectangle(cornerRadius: 10)
                                .stroke(.gray, lineWidth:1)).padding(.bottom)
                        Text("Add  Emoji").frame(maxWidth: 300, alignment: .leading)
                        
                        TextField("", text: $eventEmoji).frame(width: 300, height: 50.0, alignment: .leading)
                            .overlay(RoundedRectangle(cornerRadius: 10)
                                .stroke(.gray, lineWidth:1)).padding(.bottom)
                        
                        Text("Number of Friends").frame(maxWidth: 300, alignment: .leading)
                        
                        HStack{
                            Text("\(noFrinds)").frame(maxWidth: 300, alignment: .leading)
                            
                            Stepper("", value: $noFrinds, in: 0...20,step:1)
                            
                        }.frame(maxWidth: 300, alignment: .leading).padding(.bottom)
                        
                        VStack{
                            Text("Date and Time").frame(maxWidth: 300, alignment: .leading)
                            
                            DatePicker("", selection:  $dateTime).frame(maxWidth: 300, alignment: .center).labelsHidden().datePickerStyle(WheelDatePickerStyle())
                            
                            
                            
                            Button(action : { self.presentationMode.wrappedValue.dismiss() }){
                                Text("Publish").padding()
                                    .frame(maxWidth: 180)
                                    .font(.callout)
                                    .foregroundColor(.white)
                                    .background(Color("Prime"))
                                    .cornerRadius(12).onDisappear()  {
                                        addEvent(eventName: eventName, EventLocation: EventLocation, eventEmoji: eventEmoji, noFrinds: Int(noFrinds), dateTime: dateTime)
                                    }
                                
                            }
                        }
                        
                    }
                }
            }
        }
        
    }
    func addEvent(eventName: String, EventLocation: String, eventEmoji: String, noFrinds: Int, dateTime: Date){
        let record = CKRecord(recordType: "Event")
        record["eventName"] = eventName
        record["EventLocation"] = EventLocation
        record["noFrinds"] = noFrinds
        record["eventEmoji"] = eventEmoji
        record["dateTime"] = dateTime
        CKContainer.default().publicCloudDatabase.save(record) { record, error in
            guard  error  == nil else{
                print(error?.localizedDescription as Any)
                return
            }
        }
        
    }
}
    struct CreateEv_Previews: PreviewProvider {
        static var previews: some View {
            CreateEv()
        }
    }
    
    


