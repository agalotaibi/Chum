//
//  Log in test.swift
//  Chum
//
//  Created by Reema Alshagri on 24/05/1444 AH.
//
//
//  Log In.swift
//  Chum
//
//  Created by Reema Alshagri on 14/05/1444 AH.
//

import SwiftUI
import AuthenticationServices
import CloudKit

struct Log_In: View {
    @Environment(\.colorScheme) var darkmode
    @State var PhoneNO : String = ""
    @State var Pass : String = ""
    @State var ch: Bool = false
    @State var ch2: Bool = false
    @State private var isSecured: Bool = true
    @State var ChumUser :[ChumUsers] = []
    var isSignInButtonDisabled: Bool {
        [PhoneNO, Pass].contains(where: \.isEmpty)
    }
    
    var body: some View {
        
        
        NavigationView{
            VStack(spacing:20){
                VStack{
                    
                    Image("chumNL").resizable().aspectRatio(contentMode: .fit)
                        .frame(width: 250).padding().padding(.bottom)
                    
                    Text("Welcome Back!")
                        .font(.title)
                    Text("We're so excited to see you again!")
                        .font(.caption)
                        .fontWeight(.regular)
                    
                }
                
                
                
                SignInWithAppleButton(.continue) { request in
                    request.requestedScopes = [.fullName, .email]
                } onCompletion: { result in
                    switch result {
                    case .success(let authResults):
                        print("Authorisation successful")
                    case .failure(let error):
                        print("Authorisation failed: \(error.localizedDescription)")
                    }
                }
                .frame(width: 322.0, height: 57.0)
                .signInWithAppleButtonStyle(.whiteOutline)
                .padding()
                
                ZStack {
                    
                    
                    Divider()
                    
                    
                }
                
                
                .frame(width: 322.0, height: 0.5)
                .overlay(.gray)
                
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
              
                .background(.white)
                .cornerRadius(8)
                .fontWeight(.regular)
               
                
                
                VStack(spacing:60){
                    Text("Forgot Password?")
                        .font(.callout)
                        .fontWeight(.regular)
                        .foregroundColor(Color(red: 0.999, green: 0.613, blue: 0.203))
                        .multilineTextAlignment(.trailing)
                    
                }.padding(.leading,160)
                if ch2 == true {
                    Text("Phone number or Password Incorrect")
                        .font(.footnote)
                        .frame(width: 250.0, height: 20.0)
                        .padding(10)
                        .border(.red , width: 2)
                        
                        .background(Color(hue: 1.0, saturation: 0.216, brightness: 0.913, opacity: 0.987))
                        .foregroundColor(.white)
                        .cornerRadius(5)
                }
               
                NavigationLink(destination: TabeView() . navigationBarBackButtonHidden(true), isActive:$ch){
                    
                Button(action : {
                    Auth()
                        
                    // Register()
                }){
                    Text("Log In").padding()
                    
                    
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
                            Auth()
                          //  Register()
                        }
                        .cornerRadius(8)
                }
            }
                
               
                
                HStack{
                    Text("Don't Have an Account?")
                    
                    VStack{
                        NavigationLink{
                            
                            
                            Register()
                            .navigationBarBackButtonHidden(true)
                            
                        }
                        
                    label:{ Text("Sign Up")
                            .font(.callout)
                            .fontWeight(.bold)
                        
                        
                    }
                    .foregroundColor(Color(red: 0.999, green: 0.613, blue: 0.203))
                    }
                }
                .padding()
            }
//
        }
    }
    
    
    func Auth() {
        
        
        print("\(PhoneNO) ☕️")
        print("\(Pass)")
        let predicate1 = NSPredicate(format: "PhoneNO == %@", PhoneNO)
        let predicate2 = NSPredicate(format: "Pass == %@", Pass)
        let UserAuth = NSCompoundPredicate.init(type: .and, subpredicates: [predicate1,predicate2])
        
        let query = CKQuery(recordType:"ChumUsers", predicate: UserAuth)
        
        CKContainer.default().publicCloudDatabase.perform(query, inZoneWith: nil) { records, error in
            if error == nil{
                print(records,"🇸🇦")
                //ch = true
                
            }
            
            else {
                print("Error: \(error?.localizedDescription)🔴")
                return
            }
            if let records = records, records.count > 0{
                
                ch = true
            }else {
                ch2 = true
            }
            print(records,"🇸🇦")
        }
       
    }
    
}

struct Log_In_Previews: PreviewProvider {
    static var previews: some View {
        Log_In()
    }
}

