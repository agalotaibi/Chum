//
//  Register.swift
//  Chum
//
//  Created by Reema Alshagri on 13/05/1444 AH.
//
import SwiftUI
import CloudKit

struct Register: View {
    let buttons = ["Female", "Male"]
    @Environment(\.colorScheme) var darkmode
    @State public var buttonSelected: Int?
    @State private var isSelected = false
    @State private var  gander = 1
    @State var UserName : String = ""
    @State var PhoneNO : String = ""
    @State var Pass : String = ""
    @State var Birth = Date.now
    @State private var isSecured: Bool = true
    @State var ChumUsers :[ChumUsers] = []
    
    
    var isSignInButtonDisabled: Bool {
        [PhoneNO,Pass, UserName].contains(where: \.isEmpty)
        
        
    }
    var body: some View {
        NavigationView{
            VStack {
                
                
                Text("Create New Account")
                    .font(.title)
               
                
                HStack{
                    Image(systemName: "person.fill")
                    
                        .padding()
                    ZStack(alignment: .leading){
                        if UserName.isEmpty {
                            Text("Name")
                                .foregroundColor(.gray)
                                .fontWeight(.light)
                        }
                        
                        TextField("", text: $UserName)
                            .foregroundColor(Color.gray)
                        
                    }
                    
                    
                }
                .frame(width: 321.0, height: 57.0)
                .foregroundColor(Color.gray)
                .overlay(RoundedRectangle(cornerRadius: 8)
                    .stroke(.gray, lineWidth:1))
                .background(Color.white)
                .cornerRadius(8)
                
                
                
                HStack  {
                    Image(systemName: "phone.fill")
                        .padding()
                    ZStack(alignment: .leading){
                        if PhoneNO.isEmpty {
                            Text("Phone Number")
                                .foregroundColor(.gray)
                                .fontWeight(.light)
                        }
                        
                        TextField("", text: $PhoneNO)
                            .foregroundColor(Color.gray)
                        
                    }
                }
                .frame(width: 321.0, height: 57.0)
                .foregroundColor(Color.gray)
                .overlay(RoundedRectangle(cornerRadius: 8)
                    .stroke(.gray, lineWidth:1))
                .background(Color.white)
                .cornerRadius(8)
                .padding()
                
                
                
                
            
                DatePicker("Date of Birth:", selection: $Birth, displayedComponents: [.date])
                    .frame(maxWidth: 321, alignment: .center)
                    

                HStack(spacing: 20) {
                    ForEach(0..<buttons.count) { button in
                        Button(action: {
                            self.buttonSelected = button
                        }) {
                            Text("\(self.buttons[button])")
                                .frame(width: 120.0, height: 25.0)
                                .padding()
                                .foregroundColor(self.buttonSelected == button ? Color.white : Color.gray)
                                .background(self.buttonSelected == button ? Color(red: -0.002, green: 0.51, blue: 0.497) : Color.white)
                                .overlay(RoundedRectangle(cornerRadius: 8.5)
                                    .stroke(.gray, lineWidth:1))
                                .cornerRadius(8.5)
                            
                            
                        }
                    }
                    
                    
                }.padding()
                
                
                HStack{
                    Image(systemName: "lock.fill")
                        .padding()
                    Group {
                        ZStack(alignment: .leading){
                            if !isSecured{
                                TextField("Password", text: $Pass)
                                
                                if Pass.isEmpty{
                                    Text("Password")
                                        .foregroundColor(.gray)
                                        .fontWeight(.light)
                                    
                                }

                            }
                            else{
                                if Pass.isEmpty{
                                    Text("Password")
                                        .foregroundColor(.gray)
                                        .fontWeight(.light)
                                }

                                    SecureField("Password", text: $Pass)
                            }
                            
                            
                            
                        }.padding(.trailing, 32)
                        
                        Button(action: {
                            isSecured.toggle()
                        }) {
                            Image(systemName: self.isSecured ? "eye.slash.fill" : "eye.fill")
                                .accentColor(.gray)
                        }.padding()
                    }
                }
                .frame(width: 321.0, height: 57.0)
                .foregroundColor(Color(red: 0.557, green: 0.557, blue: 0.578))
                .overlay(RoundedRectangle(cornerRadius: 8)
                    .stroke(.gray, lineWidth:1))
                .background(Color.white)
                .cornerRadius(8)
                .fontWeight(.regular)
                
                
                
                
                HStack{
                    Group{
                        Toggle("",isOn: $isSelected)
                            .toggleStyle(ToggleCheckboxStyle())
                            .font(.title)
                            .background (Color.white)
                            .cornerRadius(4)
                        
                        Text("I Agree on Terms & conditions")
                            .fontWeight(.regular)
                        
                    }
                    
                    
                }  .foregroundColor(.gray)
                
                    .padding()
                
                
                
               
                Button(action : { }){
                    Text("Sign In").padding()
                    
                    
                        .cornerRadius(12)
                        .padding()
                        .frame(maxWidth: 200)
                        .font(.body)
                        .foregroundColor(.white)
                        .frame(width: 322.0, height: 57.0)
                        .background(
                            isSignInButtonDisabled ?
                            LinearGradient(colors: [.gray], startPoint: .topLeading, endPoint: .bottomTrailing) :
                                LinearGradient(colors: [Color(red: 0.009, green: 0.717, blue: 0.702)], startPoint: .topLeading, endPoint: .bottomTrailing)
                        ).onTapGesture()  {
                            RegisterUser(UserName:UserName, PhoneNO:PhoneNO, Pass:Pass, Birth:Birth)
                        }
                        .cornerRadius(8)
                }
                
                
          
                
                HStack{
                    Text("Have an Account?")
                    
                    VStack{
                        NavigationLink{
                            
                            Log_In()
                            .navigationBarBackButtonHidden(true)
                        }
                        
                    label:{ Text("Log In")
                            .font(.callout)
                            .fontWeight(.bold)

                        
                    }
                    .foregroundColor(Color(red: 0.999, green: 0.613, blue: 0.203))
                    }
                }
                .padding()
            }
        }
        
    }
        func RegisterUser(UserName: String, PhoneNO: String, Pass: String, Birth: Date){
            let record = CKRecord(recordType: "ChumUsers")
            record["UserName"] = UserName
            record["PhoneNO"] = PhoneNO
            record["Birth"] = Birth
            record["Pass"] = Pass
              CKContainer.default().publicCloudDatabase.save(record) { record, error in
                  guard  error  == nil else{
                   print(error?.localizedDescription as Any)
                            return
                                   }
                               }
                               
                           }

   
}
struct ToggleCheckboxStyle: ToggleStyle{
    func makeBody(configuration: Configuration) -> some View {
        Button{
            configuration.isOn.toggle()
        }label:{
            Image(systemName: configuration.isOn ? "checkmark.square": "square")
                .resizable()
                .frame(width: 24, height: 24)
                .foregroundColor(configuration.isOn ? .accentColor : .gray)
                .onTapGesture {
                    configuration.isOn.toggle()
                }
                .accentColor(.gray)
        }
        
    }
    
}

struct Register_Previews: PreviewProvider {
    static var previews: some View {
        Register()
    }
}


struct ChumUsers: Identifiable{
    let record: CKRecord
    let UserName: String
    let PhoneNO: String
    let Pass: String
    let Birth : Date
    let id: CKRecord.ID

    init(record: CKRecord){
        self.record = record
        self.id = record.recordID
        self.UserName = record["UserName"] as? String ?? ""
        self.PhoneNO = record["PhoneNO"] as? String ?? ""
        self.Pass = record["Pass"] as? String ?? ""
        self.Birth = record["Birth"] as? Date ?? Date.now

    }
}
