//
//  MainViewModel.swift
//  TestingOnlineGroceriesSwiftUI
//
//  Created by Mai huy vu on 22/1/26.
//

import Foundation
import SwiftUI
import Combine

class MainViewModel: ObservableObject {
    static let shared = MainViewModel() // Dùng chung cho toàn App
    
    @Published var isUserLogin: Bool = false
    @Published var errorMessage: String = ""
    @Published var showError: Bool = false

    func signInWithGoogle() {
        Task {
            do {
                let result = try await GoogleSignInHelper.signIn()
                print("Đăng nhập thành công: \(result.email ?? "")")
                
                await MainActor.run {
                    self.isUserLogin = true // Kích hoạt chuyển màn hình
                }
            } catch {
                await MainActor.run {
                    self.errorMessage = error.localizedDescription
                    self.showError = true
                }
            }
        }
    }
}
