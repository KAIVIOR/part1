//
//  dullView.swift
//  part1
//
//  Created by 吳庭愷 on 2021/5/11.
//

import SwiftUI
import FirebaseStorage
import FirebaseStorageSwift
import FirebaseAuth
extension View {
    func snapshot() -> UIImage {
        let controller = UIHostingController(rootView: self)
        let view = controller.view

        let targetSize = controller.view.intrinsicContentSize
        view?.bounds = CGRect(origin: .zero, size: targetSize)
        view?.backgroundColor = .clear

        let renderer = UIGraphicsImageRenderer(size: targetSize)

        return renderer.image { _ in
            view?.drawHierarchy(in: controller.view.bounds, afterScreenUpdates: true)
        }
    }
}
struct selectView: View {
    var card : Card
    var body: some View{
        Image("\(card.describ)_of_\(card.number)")
            .resizable()
            .scaledToFit()
            .frame(width: 320, height: 320,alignment: .leading)
            .offset(x: 30, y: 15)
            .frame(width: 126.8, height: 86.4)
            .background(Color.white)
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.black, lineWidth: 1)
            )
    }
}
struct monView: View {
    var card : Card
    var body: some View{
        Image("\(card.describ)_of_\(card.number)")
            .resizable()
            .scaledToFit()
            .frame(width: 320, height: 320,alignment: .leading)
            .offset(x: 30, y: -25)
            .frame(width: 126.8, height: 86.4)
            .background(Color.white)
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.black, lineWidth: 1)
            )
    }
}
struct hairView: View {
    var card : Card
    var body: some View{
        Image("\(card.describ)_of_\(card.number)")
            .resizable()
            .scaledToFit()
            .frame(width: 220, height: 320,alignment: .leading)
            .offset(x: 30, y: 45)
            .frame(width: 126.8, height: 86.4)
            .background(Color.white)
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.black, lineWidth: 1)
            )
    }
}
struct preView: View {
    var card : Card
    var body: some View{
        Image("\(card.describ)_of_\(card.number)")
            .resizable()
            .scaledToFit()
            .frame(width: 170, height: 200,alignment: .leading)
            .offset(x: 10, y: 45)
            .frame(width: 126.8, height: 86.4)
            .background(Color.white)
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.black, lineWidth: 1)
            )
    }
}
struct clothView: View {
    var card : Card
    var body: some View{
        Image("\(card.describ)_of_\(card.number)")
            .resizable()
            .scaledToFit()
            .frame(width: 220, height: 320,alignment: .leading)
            .offset(x: -10, y: -65)
            .frame(width: 126.8, height: 86.4)
            .background(Color.white)
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.black, lineWidth: 1)
            )
    }
}
struct rightView: View {
    var card : Card
    var body: some View{
        Image("\(card.describ)_of_\(card.number)")
            .resizable()
            .scaledToFit()
            .frame(width: 190, height: 320,alignment: .leading)
            .offset(x: 15, y: 23)
            .frame(width: 126.8, height: 86.4)
            .background(Color.white)
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.black, lineWidth: 1)
            )
    }
}
struct dullView: View {
    @Binding var setimage : Bool
    @State private var myAlert = Alert(title: Text(""))
    @StateObject var userpic = UserPic()
    @State private  var nick_name = ""
    @Binding var showSecondPage :Bool
    @Binding var dontsetimage :Bool
    var roles = ["目","眉","口","前髮","後髮","右髮","左髮","衣服","背景"]
    @State private var selectedIndex = 0
    @State private var  face = 0
    @State private var  bow = 0
    @State private var  mon = 0
    @State private var  pro = 0
    @State private var  pre = 0
    @State private var  cloth = 0
    @State private var  right = 0
    @State private var  left = 0
    @State private var  ground = 0
    @State private var  hairSelect = 0
    @State private var  picker = 0
    @State private var  background_page = false
    
//    @State private var showAlert = false
    @State private var currentDate = Date()
  //  @State private var currentUser = Auth.auth().currentUser
    @State private var userPhotoURL = URL(string: "")
    @State private var currentUserData = UserData(id: "", userGender: "女", age: 16, userBD: "", userFirstLogin: "")
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var alertMsg = ""
    @State private var showAlert = false
    @Binding var newUser : UserData
    var settingdullView: some View {
        ZStack{
            
            Group{
                ForEach(0..<10){
                    i in
                    if(ground == i){
                        Image("ground_of_\(i)")
                            .resizable()
                            .scaledToFill()
                            //.frame(weight: 100, height: 100)
                            
                    }
                }
              
            
                ForEach(0..<10){
                    i in
                    if(right == i){
                        Image("right_of_\(i)")
                            .resizable()
                            .scaledToFit()
                    }
                }

            }
            
                ForEach(0..<10){
                    i in
                    if(pre == i){
                        Image("pre_of_\(i)")
                            .resizable()
                            .scaledToFit()
                            
                    }
                
            
            }
          
        
        
        ForEach(0..<10){
            i in
            if(left == i){
                Image("left_of_\(i)")
                    .resizable()
                    .scaledToFit()
                    
            }
        }
            
             Image("face")
                 .resizable()
                 .scaledToFit()
            ForEach(0..<10){
                i in
                if(cloth == i){
                    Image("cloth_of_\(i)")
                        .resizable()
                        .scaledToFit()
                }
            }
            Image("hair")
                .resizable()
                .scaledToFit()
            Image("ear")
                .resizable()
                .scaledToFit()
            Image("nose")
                .resizable()
                .scaledToFit()
                //.offset(x: 0, y: -200)
            Group{
                ForEach(0..<10){
                    i in
                    if(face == i){
                        Image("eyes_of_\(i)")
                            .resizable()
                            .scaledToFit()
                    }
                }
                ForEach(0..<10){
                    i in
                    if(bow == i){
                        Image("bow_of_\(i)")
                            .resizable()
                            .scaledToFit()
                    }
                }
                ForEach(0..<10){
                    i in
                    if(mon == i){
                        Image("mon_of_\(i)")
                            .resizable()
                            .scaledToFit()
                    }
                }
                ForEach(0..<10){
                    i in
                    if(pro == i){
                        Image("pro_of_\(i)")
                            .resizable()
                            .scaledToFit()
                            .offset(x: 0,y: 0)
                    }
                }


      
            }
        }
      }
    var body: some View {
        ZStack{
            VStack{
                settingdullView
                Spacer()
                Spacer()
                VStack{
                
                Picker(selection: $selectedIndex, label: Text("\(roles[selectedIndex])")) {
                           ForEach(roles.indices) { (index) in
                              Text(roles[index])
                                
                           }
                       
                            }.pickerStyle(SegmentedPickerStyle())
                }
                Spacer()
                if (selectedIndex == 0){
                    VStack{
                        HStack{
                            
                            ForEach(0..<3){
                                i in
                                Button(action: {
                                    mon = i
                                }, label: {
                                    selectView(card: cards[i])

                                })

                            }


                        }
                        HStack{
                            ForEach(0..<3){
                                i in
                                Button(action: {
                                    mon = i + 3
                                }, label: {
                                    selectView(card: cards[i+3])

                                })

                            }


                        }
                        HStack{
                            ForEach(0..<3){
                                i in
                                Button(action: {
                                    mon = i + 6
                                }, label: {
                                    selectView(card: cards[i+6])

                                })

                            }
                        }
                        HStack{
                            Button(action: {
                                face = 9
                            }, label: {
                                selectView(card: cards[9])
                            })

                        }
                        Spacer()
                    }
                }
                if (selectedIndex == 1){
                    VStack{
                        HStack{
                            ForEach(0..<3){
                                i in
                                Button(action: {
                                    mon = i
                                }, label: {
                                    selectView(card: cards[i+10])

                                })

                            }
                        }
                        HStack{
                            ForEach(0..<3){
                                i in
                                Button(action: {
                                    mon = i + 3
                                }, label: {
                                    selectView(card: cards[i+13])

                                })

                            }
                        }
                        HStack{
                            ForEach(0..<3){
                                i in
                                Button(action: {
                                    mon = i + 6
                                }, label: {
                                    selectView(card: cards[i+16])
                                })
                            }
                        }
                        Spacer()
                    }
                }
                else if (selectedIndex == 2){
                    VStack{
                        HStack{
                            ForEach(0..<3){
                                i in
                                Button(action: {
                                    mon = i
                                }, label: {
                                    monView(card: cards[i+19])

                                })

                            }

                        }
                        HStack{
                            ForEach(0..<3){
                                i in
                                Button(action: {
                                    mon = i+3
                                }, label: {
                                    monView(card: cards[i+22])

                                })

                            }

                        }
                        HStack{
                            ForEach(0..<3){
                                i in
                                Button(action: {
                                    mon = i+6
                                }, label: {
                                    monView(card: cards[i+25])

                                })

                            }

                        }
                        HStack{
                                Button(action: {
                                    mon = 9
                                }, label: {
                                    monView(card: cards[28])

                                })
                        }
                        Spacer()

                    }
                }
                else if (selectedIndex == 3){
                    VStack{
                        HStack{
                            ForEach(0..<3){
                                i in
                                Button(action: {
                                    pro = i
                                }, label: {
                                    hairView(card: cards[i+29])

                                })

                            }

                        }
                        HStack{
                            ForEach(0..<3){
                                i in
                                Button(action: {
                                    pro = i+3
                                }, label: {
                                    hairView(card: cards[i+32])

                                })

                            }

                        }
                        HStack{
                            ForEach(0..<3){
                                i in
                                Button(action: {
                                    pro = i+6
                                }, label: {
                                    hairView(card: cards[i+35])

                                })

                            }

                        }
                        HStack{
                                Button(action: {
                                    pro = 9
                                }, label: {
                                    hairView(card: cards[38])

                                })
                        }
                        Spacer()

                    }
                }
                else if (selectedIndex == 4){
                    VStack{
                        HStack{
                            ForEach(0..<3){
                                i in
                                Button(action: {
                                    pre = i
                                }, label: {
                                    preView(card: cards[i+39])

                                })

                            }

                        }
                        HStack{
                            ForEach(0..<3){
                                i in
                                Button(action: {
                                    pre = i+3
                                }, label: {
                                    preView(card: cards[i+42])

                                })

                            }

                        }
                        HStack{
                            ForEach(0..<3){
                                i in
                                Button(action: {
                                    pre = i+6
                                }, label: {
                                    preView(card: cards[i+45])

                                })

                            }

                        }
                        
                        HStack{
                                Button(action: {
                                    pre = 9
                                }, label: {
                                    preView(card: cards[48])

                                })
                        }

                        Spacer()
                    }
                }
                
                else if (selectedIndex == 5){
                    VStack{
                            HStack{
                                    ForEach(0..<3){
                                        i in
                                    Button(action: {
                                            right = i
                                                    }, label: {
                                                        rightView(card: cloths[i+10])
                    
                                                    })
                    
                                                }
                    
                                            }
                        HStack{
                                ForEach(0..<3){
                                    i in
                                Button(action: {
                                    right = i+3
                                                }, label: {
                                                    rightView(card: cloths[i+13])
                
                                                })
                
                                            }
                
                                        }
                        HStack{
                                ForEach(0..<3){
                                    i in
                                Button(action: {
                                    right = i+6
                                                }, label: {
                                                    rightView(card: cloths[i+16])
                
                                                })
                
                                            }
                
                                        }
                        HStack{
                                
                                Button(action: {
                                    right = 9
                                                }, label: {
                                                    rightView(card: cloths[19])
                
                                                })
                
                                            
                
                                        }
                        Spacer()



                                        }
                }
                else if (selectedIndex == 6){
                    VStack{
                            HStack{
                                    ForEach(0..<3){
                                        i in
                                    Button(action: {
                                        left = i
                                                    }, label: {
                                                        rightView(card: cloths[i+20])
                    
                                                    })
                    
                                                }
                    
                                            }
                        HStack{
                                ForEach(0..<3){
                                    i in
                                Button(action: {
                                    left = i+3
                                                }, label: {
                                                    rightView(card: cloths[i+23])
                
                                                })
                
                                            }
                
                                        }
                        HStack{
                                ForEach(0..<3){
                                    i in
                                Button(action: {
                                    left = i+6
                                                }, label: {
                                                    rightView(card: cloths[i+26])
                
                                                })
                
                                            }
                
                                        }
                        HStack{
                                
                                Button(action: {
                                    left = 9
                                                }, label: {
                                                    rightView(card: cloths[29])
                
                                                })
                
                                            
                
                                        }
                        Spacer()



                                        }
                }
                else if (selectedIndex == 7){
                    VStack{
                            HStack{
                                    ForEach(0..<3){
                                        i in
                                    Button(action: {
                                            cloth = i
                                                    }, label: {
                                                        clothView(card: cloths[i])
                    
                                                    })
                    
                                                }
                    
                                            }
                        HStack{
                                ForEach(0..<3){
                                    i in
                                Button(action: {
                                    cloth = i+3
                                                }, label: {
                                                    clothView(card: cloths[i+3])
                
                                                })
                
                                            }
                
                                        }
                        HStack{
                                ForEach(0..<3){
                                    i in
                                Button(action: {
                                    cloth = i+6
                                                }, label: {
                                                    clothView(card: cloths[i+6])
                
                                                })
                
                                            }
                
                                        }
                        HStack{
                                
                                Button(action: {
                                    cloth = 9
                                                }, label: {
                                                    clothView(card: cloths[9])
                
                                                })
                
                                            
                
                                        }
                        Spacer()



                                        }
                }
                else if (selectedIndex == 8){
                    VStack{
                            HStack{
                                    ForEach(0..<3){
                                        i in
                                    Button(action: {
                                        ground = i
                                                    }, label: {
                                                        clothView(card: cloths[i+30])
                    
                                                    })
                    
                                                }
                    
                                            }
                        HStack{
                                ForEach(0..<3){
                                    i in
                                Button(action: {
                                    ground = i+3
                                                }, label: {
                                                    clothView(card: cloths[i+33])
                
                                                })
                
                                            }
                
                                        }
                        HStack{
                                ForEach(0..<3){
                                    i in
                                Button(action: {
                                    ground = i+6
                                                }, label: {
                                                    clothView(card: cloths[i+36])
                
                                                })
                
                                            }
                
                                        }
                        HStack{
                                
                                Button(action: {
                                    ground = 9
                                                }, label: {
                                                    clothView(card: cloths[39])
                                                })
                                        }
                        Spacer()



                                        }
                }


            }
                Button(action: {
                    showSecondPage = false
                    setimage = false
                    dontsetimage = false
                    FireBase.shared.createUserData(ud: newUser, uid: Auth.auth().currentUser!.uid) {
                                (result) in
                switch result {
                case .success(let sucmsg):
                        print(sucmsg)
                uploadDollPhoto()
                case .failure(_):
                        print("上傳錯誤")
                showAlertMsg(msg: "發生不明錯誤，請重新嘗試")
                                                    }
                                                }

                }, label: {
                    Text("完成頭像")
                        .bold()
                })
                .offset(x:140,y:360)
                
            
            if background_page {
                EmptyView().fullScreenCover(isPresented: $background_page)
                {
                    userView()
                }
            }
          
                Button(action: {
                    face = Int.random(in: 0...9)
                    bow = Int.random(in: 0...8)
                    mon = Int.random(in: 0...9)
                    pro = Int.random(in: 0...9)
                    pre = Int.random(in: 0...9)
                    right = Int.random(in: 0...9)
                    left = Int.random(in: 0...9)
                    cloth = Int.random(in: 0...9)
                    ground = Int.random(in: 0...9)
                }, label: {
                    
                    Image("random")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60, height: 60)
                }).offset(x:-170,y:-20)
            }
        }
    func showAlertMsg(msg: String) -> Void {
        self.alertMsg = msg
        if alertMsg == "設置基本資料成功" {
            self.myAlert = Alert(title: Text("成功"), message: Text(alertMsg), dismissButton: .default(Text("請重新登入"), action: {
                //FireBase.shared.userSingOut()
                self.presentationMode.wrappedValue.dismiss()}))
            self.showAlert = true
        }
        else {
            self.myAlert = Alert(title: Text("錯誤"), message: Text(alertMsg), dismissButton:
                .cancel(Text("重新輸入")))
            self.showAlert = true
        }
    }
    func uploadDollPhoto() -> Void {
        let image = settingdullView.snapshot()
        FireBase.shared.uploadPhoto(image: image) { result in
            switch result {
            case .success(let url):
                print("上傳照片成功")
                FireBase.shared.setUserPhoto(url: url) { result in
                    switch result {
                    case .success(let msg):
                        print(msg)
                        print("我已經成功上傳")
                    case .failure(_):
                        print("設置頭像錯誤")
                    }
                }
            case .failure(let error):
               print(error)
                }
            }
        }
    }
struct dullView_Previews: PreviewProvider {
    static var previews: some View {
        dullView( setimage: .constant(true), showSecondPage: .constant(true), dontsetimage: .constant(true), newUser:.constant(UserData(id: "dd", userGender: "dd", age: 16, userBD: "dd", userFirstLogin: "dd"))
        )
    }
}
