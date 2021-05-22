//
//  settingView.swift
//  part1
//
//  Created by 吳庭愷 on 2021/5/10.
//

import SwiftUI

struct settingView: View {
    @StateObject var pageObject = PageObject()
    @Binding var user: String
    @State private  var nick_name = ""
    
    var body: some View {
        ZStack{
            Color("Color-3").edgesIgnoringSafeArea(.all)
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
            .offset(x: 0, y: -340)
            Button(action: {
                pageObject.dull_page = true
            }, label: {
                Text("個人頭像設定")
            })
            

        }
      
    }
}

struct settingView_Previews: PreviewProvider {
    static var previews: some View {
        settingView( user: .constant(""))
    }
}
