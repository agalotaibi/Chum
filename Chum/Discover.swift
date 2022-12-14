//
//  Discover.swift
//  Chum
//
//  Created by Amaal on 13/05/1444 AH.
//

import SwiftUI
import CloudKit

struct Discover: View {
    @State var events :[Event] = []
    var body: some View {
        
        VStack{
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
                    
                    List{
                        ForEach(events) { event  in
                            Section{
                                HStack(spacing: 2){                    Text("\(event.eventEmoji)")
                                        .font(.system(size: 40)).frame(width: 70, height: 70)
                                        .clipShape(Circle())
                                        .padding()
                                        .padding(.horizontal, 2)
                                    
                                    VStack(alignment: .leading, spacing:6){
                                        Text("\(event.eventName)")
                                            .font(.title3)
                                            .fontWeight(.semibold)
                                        Text("In \(event.EventLocation)")
                                        Text("With \(event.noFrinds) Friends")
                                        
                                        Text("at  \(event.dateTime.displayFormat) ")
                                        
                                    }
                                    .padding(6)
                                }
                                
                            }
                        }.listRowBackground(Color("Prime"))
                     }
                    .listStyle(InsetGroupedListStyle())
                     .onAppear{
                         fetchEvent()



                     }
                    
                    
                }
            }
            
        }
        
    }
    
    func fetchEvent(){
        let predicate = NSPredicate(value: true)
        let query = CKQuery(recordType:"Event", predicate: predicate)
        let operation = CKQueryOperation(query: query)
        operation.recordMatchedBlock = {recordID, result in
            switch result{
            case .success(let record):
                let event = Event(record: record)
                events.append(event)
            case .failure(let error):
                print("Error:\(error.localizedDescription)")
            }
        }
        
        CKContainer.default().publicCloudDatabase.add(operation)

    }
    
}
    



struct Discover_Previews: PreviewProvider {
    static var previews: some View {
        Discover()
    }
}

struct Event: Identifiable{
    let record: CKRecord
    let eventName: String
    let EventLocation: String
    let eventEmoji: String
    let noFrinds: Int
    let dateTime : Date
    let id: CKRecord.ID
    
    init(record: CKRecord){
        self.record = record
        self.id = record.recordID
        self.eventName = record["eventName"] as? String ?? ""
        self.EventLocation = record["EventLocation"] as? String ?? ""
        
        self.eventEmoji = record["eventEmoji"] as? String ?? ""
        
        self.noFrinds = record["noFrinds"] as? Int ?? 0
        self.dateTime = record["dateTime"] as? Date ?? Date.now
        
    }

    
    
}

extension Date {
    var displayFormat: String{
        self.formatted(
            .dateTime
             //   .year(.twoDigits)
                .month()
                .day()
                .hour()
                .minute()
            
        )
    }
}
