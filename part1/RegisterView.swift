//
//  LoginView.swift
//  part1
//
//  Created by 吳庭愷 on 2021/5/7.
//

import SwiftUI
import FirebaseAuth

struct RegisterView: View {
    @State  var user = ""
    @State  var pass = ""
    @State  var check_pass = ""
    @State  var pass_not_same = false
    @State  var pass_same = false
    @StateObject var pageObject = PageObject()
    var body: some View {
        ZStack{
            Color("Color-3").edgesIgnoringSafeArea(.all)
                        VStack{
            
                HStack{
                Image(systemName: "person.fill").resizable().frame(width: 20, height: 20).padding(.bottom, 15)
                
                TextField("Username", text: $user).padding(.leading, 12).font(.system(size: 20))
            }.padding(12)
                .background(Color("Color-2"))
                .cornerRadius(20)
            VStack{
                
                    HStack{
                    Image(systemName: "lock.fill").resizable().frame(width: 20, height: 20).padding(.bottom, 15)
                    
                    TextField("Password", text: $pass).padding(.leading, 12).font(.system(size: 20))
                        
                }.padding(12)
                    .background(Color("Color-2"))
                    .cornerRadius(20)
                HStack{
                        Image(systemName: "lock.fill").resizable().frame(width: 20, height: 20).padding(.bottom, 15)
                        
                        TextField("密碼確認", text: $check_pass).padding(.leading, 12).font(.system(size: 20))
                            
                    }.padding(12)
                        .background(Color("Color-2"))
                        .cornerRadius(20)
            }
                            VStack{
                                
                    
                        Button(action: {
                            if (pass == check_pass){
                                pass_same = true
                                pageObject.setting = true
                                Auth.auth().createUser(withEmail: user, password: pass) { result, error in
                                        
                                    guard let user = result?.user,
                                    error == nil else {
                                    print(error?.localizedDescription)
                                            return
                                                        }
                                    print(user.email, user.uid)
                                                        }
                                
                                
                            }
                            else{
                                pass_not_same = true
                            }
                            
                                    
                        }, label: {
                                        Text("註冊")
                                            .bold()
                                            .overlay(                        RoundedRectangle(cornerRadius: 10)
                                                        .stroke(Color.black, lineWidth: 2)
                                                        .frame(width: 63, height:40)
            )
                                    
                        }).padding()
                        .alert(isPresented: $pass_not_same)
                        { () -> Alert in
                            Alert(title: Text("您所輸入的密碼並不相同"), message: Text("請再輸入一次密碼"), dismissButton: .default(Text("好的"), action: {
                                pass_not_same = false
                            }))
                                    }
                                   
                        
                                }
                              

            }
            if(pageObject.setting == true){
                firstloginView( user: $user)
            }
        }
       
     
    }
    
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
