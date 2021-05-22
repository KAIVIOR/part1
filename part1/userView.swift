//
//  backgroundView.swift
//  part1
//
//  Created by 吳庭愷 on 2021/5/13.
//

import SwiftUI
import Kingfisher
import FirebaseAuth

struct userView: View {
    init(){
        UITableView.appearance().backgroundColor = .clear
    }
    //@State private var currentUser = Auth.auth().currentUser
    @State private var userPhotoURL = URL(string: "")
    @State private var showContentView = false
    @State private var currentUserData = UserData(id: "", userGender: "", age: 16, userBD: "", userFirstLogin: "")
    var body: some View {
        ZStack
        {
            Color("Color-3").edgesIgnoringSafeArea(.all)
            VStack{
                
                Form {
                    HStack{
                        Text("個人資料")
                            .font(.system(size: 27))
                            .bold()
                    }
                    .frame(height: 100)
                    
                    HStack {
                        Spacer()
                        KFImage(Auth.auth().currentUser?.photoURL)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 190, height: 200)
                        Spacer()
                    }
                    Group{
                        HStack{
                    
                           
                        Image(systemName: "person.fill")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .padding(.bottom,5)
                            
                            if Auth.auth().currentUser?.displayName != nil {
                                Text("暱稱:  " +  (Auth.auth().currentUser?.displayName)!)
                            } else {
                                Text("暱稱錯誤")
                            }

                       
                            
                    }   .padding(12)
                        .background(Color("Color-2"))
                        .cornerRadius(20)

                        HStack{
                            Image(systemName: "g.circle")
                            Text("性別: " + currentUserData.userGender)
                        }
                        .padding(12)
                        .background(Color("Color-2"))
                        .cornerRadius(20)
                  
                        HStack{
                            Image(systemName: "person.crop.rectangle")
                            Text("年紀: " + String(currentUserData.age))
                        }
                        .padding(12)
                        .background(Color("Color-2"))
                        .cornerRadius(20)
                        HStack{
                            Image(systemName: "calendar.circle")
                            Text("生日: " + currentUserData.userBD)
                        }
                        .padding(12)
                        .background(Color("Color-2"))
                        .cornerRadius(20)
                        HStack{
                            Image(systemName: "clock")
                            Text("首次登入: " + currentUserData.userFirstLogin)
                        }
                        .padding(12)
                        .background(Color("Color-2"))
                        .cornerRadius(20)
                        HStack{
                            Text("UID: " + Auth.auth().currentUser!.uid)
                            //
                        }
                        .padding(12)
                        .background(Color("Color-2"))
                        .cornerRadius(20)
                        HStack{
                            Spacer()
                            Button(action: {
                                FireBase.shared.userSingOut()
                                showContentView = true
                            }, label: {
                                    Image(systemName: "figure.walk")
                                    Text("登出")
                                        .bold()
                            }).buttonStyle(PlainButtonStyle())
                            .fullScreenCover(isPresented: $showContentView, content: {
                                LoginView()
                            })
                            Spacer()
                        }
                        .padding(12)
                        .background(Color("Color-2"))
                        .cornerRadius(20)


                    }

                }
            }
            .onAppear(perform: {
                userPhotoURL = (Auth.auth().currentUser?.photoURL)
                FireBase.shared.fetchUsers(){ result in
                    switch (result) {
                    case .success(let usersArray):
                        for u in usersArray {
                            if u.id == Auth.auth().currentUser?.uid {
                                currentUserData = u
                                break
                            }
                        }
                    case .failure(_):
                        print("抓取失敗，找不到使用者資料")
                    }
                }

            })
        }
     
     
       
    }
}

struct userView_Previews: PreviewProvider {
    static var previews: some View {
        userView()
    }
}
