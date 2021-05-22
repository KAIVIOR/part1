//
//  ContentView.swift
//  part1
//
//  Created by 吳庭愷 on 2021/5/7.
//

import SwiftUI
import FirebaseStorage
import FirebaseStorageSwift
import FirebaseAuth
struct ContentView: View {
    var textView: some View {
          Text("Hello, SwiftUI")
              .padding()
              .background(Color.blue)
              .foregroundColor(.white)
              .clipShape(Capsule())
      }

  
    var body: some View {
        VStack {
                    textView
            Button("Save to image") {
                           let image = textView.snapshot()

                           UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
                       }
                    
                  
                
        }
        
    }
    func setUserPhoto(url: URL) {
            let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
            changeRequest?.photoURL = url
            changeRequest?.commitChanges(completion: { error in
               guard error == nil else {
                   print(error?.localizedDescription)
                   return
               }
            })
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
