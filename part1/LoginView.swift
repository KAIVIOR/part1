//
//  LoginView.swift
//  part1
//
//  Created by 吳庭愷 on 2021/5/7.
//.ear

import SwiftUI
import FirebaseAuth

struct LoginView: View {
    @State  var user = ""
    @State  var pass = ""
    @State private var alertMsg = ""
    @State private var showAlert = false
    @State private var showView = false
    @State private var succed = false
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
            }
                            
                            VStack{
                                
                                HStack(alignment: .bottom, spacing: 50, content: {

                                    Button(action:{
                                        FireBase.shared.userSingIn(userEmail: user, pw: pass){
                                            (result) in
                                            switch result {
                                            case .success( _):
                                                if let user = Auth.auth().currentUser {
                                                    print("\(user.uid) 登入成功")
                                                    FireBase.shared.fetchUsers(){
                                                        (result) in
                                                        switch result {
                                                        case .success(let udArray):
                                                            print("使用者資料抓取成功")
                                                            for u in udArray {
                                                                if u.id == user.uid {
                                                                    succed = true
                                                                    //登入成功
                                                                }
                                                            }
                                                            showView = true
                                                            
                                                        case .failure(_):
                                                            print("使用者資料抓取失敗")
                                                            succed = false
                                                            //showView = true
                                                        }
                                                    }
                                                } else {
                                                    print("登入失敗")
                                                }
                                            case .failure(let errormsg):
                                                switch errormsg {
                                                case .pwInvalid:
                                                    alertMsg = "密碼錯誤"
                                                    showAlert = true
                                                case .noAccount:
                                                    alertMsg = "帳號不存在，請註冊或使用其他帳號"
                                                    showAlert = true
                                                case .others:
                                                    alertMsg = "不明原因錯誤，請重新登入"
                                                    showAlert = true
                                                }
                                            }
                                        }
                                    }){
                                        Text("登入")
                                            .bold()
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 10)
                                                    .stroke(Color.black, lineWidth: 2)
                                                    .frame(width: 63, height:40))
                                            
                                    }
                                    //succed == true 代表一定是成功的 但不知道是否有個資
                                    if succed {
                                        EmptyView().fullScreenCover(isPresented: $showView)
                                            { userView() }
                                    }
                                    else {
                                        EmptyView().fullScreenCover(isPresented: $showView)
                                            { firstloginView(user: $user) }
                                    }

                                    Button(action: {
                                        pageObject.register_page = true
                                    }, label: {
                                                    Text("註冊")
                                                        .bold()
                                                        .overlay(
                                                        RoundedRectangle(cornerRadius: 10)
                                                        .stroke(Color.black, lineWidth: 2)
                                                        .frame(width: 63, height:40))
                                    }).fullScreenCover(isPresented: $pageObject.register_page, content: {
                                                RegisterView()
                                            })

                                }).offset(x: 0, y: 50)
                                  
                                
                     
                                
                        
                            }
                              

            }.background(
                Image("screen-1")
                    
                    
                    .contrast(0.8)
            )
                        

                 
        }
       
     
    }
  
    
}

struct LoginView_PreView: PreviewProvider {
    static var previews: some View {
        Group {
            LoginView()
            LoginView()
        }
    }
}
struct button {
    var buttonText: String
    var body: some View {
        Text(buttonText)
            .bold()
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.black, lineWidth: 2)
                    .frame(width: 63, height:40))
          

    }
}
