//
//  Profile.swift
//  Chum
//
//  Created by amal alothman on 13/05/1444 AH.
//

import SwiftUI


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
    
    let backgroundColorHex = "#00B7B3" // shows up as #38424c in iOS >= 13
    let tintColorHex = "#ebdb34"
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(hex: backgroundColorHex)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .normal)
    }
    
    @State private var events = 0
    
    var body: some View {
        ZStack {
            
            VStack (spacing: 15){
                Image("user").resizable()
                    .frame(width: 150 ,height: 150).cornerRadius(80) /// make the background rounded
                    .overlay( /// apply a rounded border
                        RoundedRectangle(cornerRadius: 80)
                            .stroke(Color(hex: 0xFF9C34), lineWidth: 4)
                    )
                
              
                Text("Hi! this is your space to tell people more about you!")
                .fontWeight(.semibold).multilineTextAlignment(.center).padding(/*@START_MENU_TOKEN@*/.horizontal, 55.0/*@END_MENU_TOKEN@*/).padding(.top, 25)
                
                ZStack {
                    
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color(hex: 0xFF9C34))
                        .frame(width: 66, height: 28)
                    HStack {
                        Image(systemName: "person.2").resizable()
                            .frame(width: 20 ,height: 15) /// make the background rounded
                        ///
                        Text("22").font(.system(size: 17)).fontWeight(.regular)
                            
                    }
                }.padding(.top, 25)
                
                VStack {
                    Picker("Events?", selection: $events) {
                        Text("Joint Events (5)").fontWeight(.semibold).tag(0)
                        Text("Published Events (3)").fontWeight(.semibold).tag(1)
                    }
                    .pickerStyle(.segmented).frame(width: .infinity ,height: 35)
                     // Text("Value: \(favoriteColor)")
                  
                }.padding(.top)
                
                HStack {
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 25)
                            .fill(Color(hex: 0xF4F3F3))
                            .frame(width: 160, height: 222).opacity(0.90)
                        VStack {
                            Image("movie").resizable()
                                .frame(width: 160 ,height: 187).cornerRadius(25).padding(.top, -18)
                            
                            HStack {
                                
                                Text("Movie Night").font(.system(size: 10)).fontWeight(.regular)
                                    .foregroundColor(Color.black).padding(.trailing)
                                
                                Image(systemName: "mappin.and.ellipse").resizable()
                                    .foregroundColor(Color.black)
                                    .frame(width: 10 ,height: 10)
                                    
                                Text("AMC").font(.system(size: 10)).fontWeight(.regular)
                                    .foregroundColor(Color.black)
                            }
                        }
                        ZStack {
                            RoundedRectangle(cornerRadius: 11)
                                .fill(Color(hex: 0xFF9C34))
                                .frame(width: 40, height: 35)
                            
                            Text("5 Dec").font(.system(size: 10)).fontWeight(.regular)
                        }.padding(.top, 100).padding(.trailing,105)
                        
                        
                    }.padding()
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 25)
                            .fill(Color(hex: 0xF4F3F3))
                            .frame(width: 160, height: 222).opacity(0.90)
                        VStack {
                            Image("horse").resizable()
                                .frame(width: 160 ,height: 187).cornerRadius(25).padding(.top, -18)
                            
                            HStack {
                                
                                Text("Horse Riding").font(.system(size: 10)).fontWeight(.regular)
                                    .foregroundColor(Color.black).padding(.trailing)
                                
                                Image(systemName: "mappin.and.ellipse").resizable()
                                    .foregroundColor(Color.black)
                                    .frame(width: 10 ,height: 10)
                                    
                                Text("Derab").font(.system(size: 10)).fontWeight(.regular)
                                    .foregroundColor(Color.black)
                            }
                        }
                        ZStack {
                            RoundedRectangle(cornerRadius: 11)
                                .fill(Color(hex: 0xFF9C34))
                                .frame(width: 40, height: 35)
                            
                            Text("5 Dec").font(.system(size: 10)).fontWeight(.regular)
                        }.padding(.top, 100).padding(.trailing,105)
                        
                        
                    }
                }
                
                
                
                Spacer()
                
            }
            
                     
                           
                          
                    
                   }
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
    }
}
