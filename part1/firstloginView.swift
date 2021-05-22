//
//  firstloginView.swift
//  part1
//
//  Created by 吳庭愷 on 2021/5/12.
//
import Kingfisher
import SwiftUI
import FirebaseAuth
import FirebaseFirestoreSwift
import FirebaseFirestore
struct firstloginView: View {
    @State private var registerseceed = false
    @State private var second = false
    @State private var dontsetimage = true
    @State private var image = true
    @State private var showFLView = false
    @State private var alertMsg = ""
    @State private var showAlert = false
    @State private var go_personal = false
    @State private var  hairSelect = 0
    @State private var  picker = 0
    @State private var myAlert = Alert(title: Text(""))
    @StateObject var userpic = UserPic()
    //@State private var currentUser = Auth.auth().currentUser
    @State private var usernick_name = ""
    @State private var userFirstLoginStr = ""
    @State private var userBD = Date()
    @State private var currentDate = Date()
    @StateObject var pageObject = PageObject()
    @State private var go_set_dull = false
    @State private var setimage = true
    var gender = ["男", "女"]
    @State private var genderSelect = 0
    let myDateFormatter = DateFormatter()
    let flgFormatter = DateFormatter()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Binding var user: String
    @State private var userPhotoURL = URL(string: "")
    @State private var newUser = UserData(id: "", userGender: "", age: 16, userBD: "", userFirstLogin: "")
    @State private var birthday = Date()
    @State private var age: CGFloat = 18
    var body: some View {
        ZStack{
            
            Form{
                
            VStack{
                HStack{
                    ZStack{
                        
                        if setimage{
                            Button(action: {
                                go_set_dull = true
                                
                            }, label: {
                                Image("first3")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 200, height: 220)
                                    .clipShape(Circle())
                                
                            })
                            .buttonStyle(PlainButtonStyle())
                        }
                        else {
                            Button(action: {
                                go_set_dull = true
                                
                            }, label: {
                                    KFImage(userPhotoURL)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 200, height: 220)
                                    .clipShape(Circle())
                            })
                            .buttonStyle(PlainButtonStyle())
                           
                        }
                        
                    }
                    if  go_set_dull{
                        EmptyView().fullScreenCover(isPresented: $go_set_dull)
                            {
                            dullView(setimage: $setimage, showSecondPage: $go_set_dull, dontsetimage: $dontsetimage, newUser: $newUser)
                        }
                    }
                    
                }
                
                Text("設定個人資料")
                    .font(.system(size: 27))
                    .bold()
                Group{
                    HStack{
                
                       
                    Image(systemName: "person.fill")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .padding(.bottom,5)
                        
                    
                    Text(user)
                        .padding(.trailing)
                        .font(.system(size: 20))
                        
                        
                }.padding(12)
                    .background(Color("Color-2"))
                    .cornerRadius(20)
              
                    HStack{
                        Image(systemName: "person.crop.circle")
                        TextField("輸入暱稱", text: $usernick_name)
                    }
                    Spacer()
                    HStack{
                        Image(systemName: "person.crop.rectangle")
                        Text("年紀: \(Int(age))")
                                 Slider(value: $age, in: 16...80, step: 1, minimumValueLabel: Text("16"), maximumValueLabel: Text("80")) {
                                    Text("age")
                                 }
                    }
                    Spacer()
                    HStack{
                        Image(systemName: "g.circle")
                        Text("性別")
                        Spacer()
                        Picker(selection: $genderSelect, label: Text("性別")) {
                            Text(gender[0]).tag(0)
                            Text(gender[1]).tag(1)
                        }.pickerStyle(SegmentedPickerStyle())
                        .frame(width: 100)
                        .shadow(radius: 5)
                    }
                    
                    HStack{
                        Image(systemName: "calendar")
                        Text("生日")
                        Spacer()
                        Text(myDateFormatter.string(from: userBD))
                    }
                    DatePicker("生日", selection: $userBD, in: ...Date(), displayedComponents: .date)
                    .datePickerStyle(GraphicalDatePickerStyle())
                   

//                    DatePicker("生日", selection: $userBD, in: ...Date(), displayedComponents: .date)
//                    .datePickerStyle(GraphicalDatePickerStyle())
//
                  
                    Button(action: {
                        //dontset = true 代表已經設定好圖
                        if !dontsetimage{
                            go_personal = true
                                print("first登入我來了：" + userFirstLoginStr)
                               FireBase.shared.setUserDisplayName(userDisplayName: usernick_name)
                             //  createUserData()
                            modifySong()
                        }
                        second = true
                        
                    }, label: {
                        Text("完成設定")
                            .bold()
                            .overlay(
                            RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.blue, lineWidth: 2)
                            .frame(width: 83, height:30))
                            
                    }).buttonStyle(PlainButtonStyle())
                   
                    .alert(isPresented: $second)
                    { () -> Alert in
                        Alert(title: Text("您已經成功註冊"), message: Text("請再重新登入帳號"), dismissButton: .default(Text("好的"), action: {
                            registerseceed = true
                        }))
                    }
                    Button(action: {}, label: {
                        
                    })
                    .alert(isPresented: $dontsetimage)
                    { () -> Alert in
                        Alert(title: Text("注意要記得先設置頭像"), message: Text(" "), dismissButton: .default(Text("好的"), action: {
                            dontsetimage = true
                        }))
                    }
                    .fullScreenCover(isPresented: $registerseceed, content: {
                        LoginView()
                    })


                            }   

                        }
            .onAppear(perform: {
                self.userFirstLoginStr = flgFormatter.string(from: currentDate)
                myDateFormatter.dateFormat = "y MMM dd"
                flgFormatter.dateFormat = "y MMM dd HH:mm"
                //記錄第一次登入時間    
                userPhotoURL = (Auth.auth().currentUser?.photoURL)
                    
            }
            )

                    }
            
//            if go_personal{
//                EmptyView().fullScreenCover(isPresented: $go_personal)
//                    {
//                    userView()
//                }
//            }
                       
                }
        
          }
    func modifySong() {
            let db = Firestore.firestore()
            let documentReference =
                db.collection("Users_Data").document(Auth.auth().currentUser!.uid)
            documentReference.getDocument { document, error in
                            
              guard let document = document,
                    document.exists,
                    var user_data = try? document.data(as: UserData.self)
              else {
                        return
              }
                print("我在進行修改")
                user_data.userBD = myDateFormatter.string(from: userBD)
                user_data.age = Int(age)
                user_data.userFirstLogin = userFirstLoginStr
                user_data.userGender = gender[genderSelect]

              do {
                 try documentReference.setData(from: user_data)
              } catch {
                 print(error)
              }
                            
            }
    }
    func createUserData() {
            let db = Firestore.firestore()
            
        let userdata = UserData(id: "", userGender: gender[genderSelect], age: Int(age), userBD: myDateFormatter.string(from: userBD), userFirstLogin: userFirstLoginStr)
            do {
                let documentReference = try db.collection("Users_Data").addDocument(from: userdata)
                print("createUserData自己的："+documentReference.documentID)
            } catch {
                print(error)
            }
    }

    func go2FirstLoginView() -> Void {
        print(Auth.auth().currentUser!.uid)
        self.presentationMode.wrappedValue.dismiss()
        self.showFLView = true
    }
  
      func showAlertMsg(msg: String) -> Void {
        self.alertMsg = msg
        if alertMsg == "註冊成功" {
            self.myAlert = Alert(title: Text("成功"), message: Text(alertMsg), dismissButton: .cancel(Text("前往設置個人資料"), action:go2FirstLoginView))
            //
            self.showAlert = true
        }
        else {
            self.myAlert = Alert(title: Text("錯誤"), message: Text(alertMsg), dismissButton: .cancel(Text("重新輸入")))
            self.showAlert = true
        }
    }

}

struct firstloginView_Previews: PreviewProvider {
    static var previews: some View {
        firstloginView(  user: .constant(""))
    }
}
