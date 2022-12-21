//
//  Profile.swift
//  Chum
//
//  Created by amal alothman on 13/05/1444 AH.
//

import SwiftUI
import CloudKit

extension Color {
    init(hex: Int, opacity: Double = 1.0) {
        let red = Double((hex & 0xff0000) >> 16) / 255.0
        let green = Double((hex & 0xff00) >> 8) / 255.0
        let blue = Double((hex & 0xff) >> 0) / 255.0
        self.init(.sRGB, red: red, green: green, blue: blue, opacity: opacity)
    }
}


extension UIColor {
  public convenience init?(hex hexUser: String) {
  let r, g, b, a: CGFloat

  let hex = "\(hexUser)FF" // append alpha compnent for ease of example

  if hex.hasPrefix("#") {
  let start = hex.index(hex.startIndex, offsetBy: 1)
  let hexColor = String(hex[start...])

  if hexColor.count == 8 {
  let scanner = Scanner(string: hexColor)
  var hexNumber: UInt64 = 0

  if scanner.scanHexInt64(&hexNumber) {
  r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
  g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
  b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
  a = CGFloat(hexNumber & 0x000000ff) / 255

  self.init(red: r, green: g, blue: b, alpha: a)
  return
  }
  }
  }

  return nil
  }
}



struct Profile: View {
    @State var events :[Event] = []
    
    
    let backgroundColorHex = "#00B7B3" // shows up as #38424c in iOS >= 13
    let tintColorHex = "#ebdb34"
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(hex: backgroundColorHex)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .normal)
    }
    
    @State private var events2 = 0
    
    
    var body: some View {
        ZStack {
            NavigationView{
                
                VStack (spacing: 15){
                    Image("Lhome").resizable()
                        .frame(width: 150 ,height: 150).cornerRadius(80) /// make the background rounded
                        .overlay( /// apply a rounded border
                            RoundedRectangle(cornerRadius: 80)
                                .stroke(Color(hex: 0xFF9C34), lineWidth: 8)
                        )
                    
                    Text("Hi ! this is your space to tell people more about you")
                        .fontWeight(.semibold).multilineTextAlignment(.center).padding(/*@START_MENU_TOKEN@*/.horizontal, 55.0/*@END_MENU_TOKEN@*/).padding(.top, 25)
                    
                    
                    ZStack {
                        NavigationLink{
                            friendsList()
                        }
                        
                    label:{
//                        RoundedRectangle(cornerRadius: 25)
//                            .fill(Color(hex: 0xFF9C34))
//                            .frame(width: 66, height: 28)
                        HStack {
                            Image(systemName: "person.2").resizable()
                                .frame(width: 20 ,height: 15).foregroundColor(Color.white) /// make the background rounded
                            
                            Text("22").font(.system(size: 17)).fontWeight(.regular).foregroundColor(Color.white)
                            
                        }.frame(width: 70 ,height: 30).background(Color(hex: 0xFF9C34)).cornerRadius(20)
                    }}.padding(.top, 25)
                    
                    VStack {
                        Picker("Events?", selection: $events2, content: {
                            Text("Current Events ").fontWeight(.semibold).tag(0)
                            Text("History Events").fontWeight(.semibold).tag(1)
                        })
                        .pickerStyle(.segmented).frame(width: 350 ,height: 35)
                        // Text("Value: \(favoriteColor)")
                        
                    }.padding(.top)
                    // Text("Selected color: \(events2)")
                    
                    if events2 == 0 {
                        List{
                            ForEach(events) { event  in
                                if event.dateTime >= Date.now {
                                    Section{
                                        HStack(spacing: 2){                    Text("\(event.eventEmoji)")
                                                .font(.system(size: 50)).frame(width: 70, height: .infinity)
                                            
                                            
                                            VStack(alignment: .leading, spacing:6){
                                                Text("\(event.eventName)")
                                                    .font(.title3)
                                                    .fontWeight(.semibold)
                                                Text("In \(event.EventLocation)")
                                                
                                                Text("at  \(event.dateTime.displayFormat1) ")
                                                
                                                
                                                
                                            }.padding(6)
                                                .padding(.leading,20)
                                        }
                                        
                                    }}
                            }.listRowBackground(Color("Prime"))
                        }
                        .listStyle(InsetGroupedListStyle())
                        .onAppear{
                            fetchEvent()
                            
                            
                        }
                    }
                    
                    if events2 == 1 {
                        List{
                            ForEach(events) { event  in
                                if event.dateTime < Date.now {
                                    Section{
                                        HStack(spacing: 2){                    Text("\(event.eventEmoji)")
                                                .font(.system(size: 50)).frame(width: 70, height: .infinity)
                                            
                                            
                                            VStack(alignment: .leading, spacing:6){
                                                Text("\(event.eventName)")
                                                    .font(.title3)
                                                    .fontWeight(.semibold)
                                                Text("In \(event.EventLocation)")
                                                
                                                Text("at  \(event.dateTime.displayFormat1) ")
                                                
                                                
                                                
                                            }.padding(6)
                                                .padding(.leading,20)
                                        }
                                        
                                    }}
                            }.listRowBackground(Color("Prime"))
                        }
                        .listStyle(InsetGroupedListStyle())
                        .onAppear{
                            fetchEvent()
                            
                            
                        }
                    }
                    
                }
                
            }}
        
        
    }
    
    
    func fetchEvent(){
        events.removeAll()
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


struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
    }
}



extension Date {
    var displayFormat1: String{
        self.formatted(
            .dateTime
             //   .year(.twoDigits)
                .month()
                .day()
//                .hour()
//                .minute()
            
        )
    }
}


