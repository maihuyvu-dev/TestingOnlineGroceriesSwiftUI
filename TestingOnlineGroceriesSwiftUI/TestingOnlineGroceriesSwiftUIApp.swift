//
//  TestingOnlineGroceriesSwiftUIApp.swift
//  TestingOnlineGroceriesSwiftUI
//
//  Created by Mai huy vu on 21/1/26.
//

import SwiftUI
import FirebaseCore

@main
struct TestingOnlineGroceriesSwiftUIApp: App {
    
    init() {
        FirebaseApp.configure()
        print("Firebase đã được cấu hình thành công!")
    }
    
    @StateObject var mainVM = MainViewModel.shared
    
    var body: some Scene {
        WindowGroup {
            if mainVM.isUserLogin {
                //HomeView()
                MainTabView()
            } else {
                NavigationStack {
                    WelcomeView()
                }
            }
        }
    }
}
