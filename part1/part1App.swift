//
//  part1App.swift
//  part1
//
//  Created by 吳庭愷 on 2021/5/7.
//

import SwiftUI

@main
struct part1App: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            //dullView()
            LoginView()
            //testView()
            //testView()
            //firstloginView(user: .constant(""))
            //dullView()
            //RegisterView()
        }
    }
}
