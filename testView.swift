//
//  testView.swift
//  part1
//
//  Created by 吳庭愷 on 2021/5/21.
//

import SwiftUI
import FirebaseStorage
import FirebaseFirestore
import FirebaseStorageSwift
import FirebaseFirestoreSwift
import FirebaseAuth
struct Song: Codable, Identifiable {
    @DocumentID var id: String?
    let name: String
    let singer: String
    let rate: Int
}
struct testView: View {
    @State private var userBD = Date()
    let myDateFormatter = DateFormatter()
    let flgFormatter = DateFormatter()
    @State private var birthday = Date()

    var body: some View {
        VStack{
            Button(action: {
                       createSong()
                   }, label: {
                       Text("Button")
                   })
            DatePicker("生日:", selection: $birthday, displayedComponents: .date)
                   
        }
       
    }
    func createSong() {
            let db = Firestore.firestore()
            
        let userdata = UserData(id: "", userGender: "girl", age: 16, userBD: "0521", userFirstLogin: "now")
            do {
                let documentReference = try db.collection("User_Data").addDocument(from: userdata)
                print(documentReference.documentID)
            } catch {
                print(error)
            }
    }
}

struct testView_Previews: PreviewProvider {
    static var previews: some View {
        testView()
    }
}
