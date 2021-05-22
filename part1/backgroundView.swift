//
//  backgroundView.swift
//  part1
//
//  Created by 吳庭愷 on 2021/5/13.
//

import SwiftUI
import Kingfisher
import FirebaseAuth

struct backgroundView: View {
    @State private var currentUserData = UserData(id: "", userGender: "", userBD: "", userFirstLogin: "")
    @State private var currentUser = Auth.auth().currentUser
    @State private var userPhotoURL = URL(string: "")
    @State private var showContentView = false
    var body: some View {
        VStack{
            Form {
                HStack{
                    Text("個人資料")
                        .font(.system(size: 27))
                        .bold()
                    Image("first3")
                        .resizable()
                        .scaledToFill()
                        .frame(height: 3)
                }
                .frame(height: 100)
                HStack {
                    Spacer()
                    KFImage(userPhotoURL)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 150)
                    Spacer()
                }
            }
        }.onAppear{
            userPhotoURL = (currentUser?.photoURL)
            FireBase.shared.fetchUsers(){ result in
                switch (result) {
                case .success(let usersArray):
                    for u in usersArray {
                        if u.id == currentUser?.uid {
                            currentUserData = u
                            break
                        }
                    }
                case .failure(_):
                    print("抓取失敗，找不到使用者資料")
                }
            }
        }

       
    }
}

struct backgroundView_Previews: PreviewProvider {
    static var previews: some View {
        backgroundView()
    }
}
