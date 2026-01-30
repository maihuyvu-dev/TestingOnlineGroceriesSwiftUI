//
//  SignInWithGoogleHelper.swift
//  TestingOnlineGroceriesSwiftUI
//
//  Created by Mai huy vu on 22/1/26.
//

import Foundation
import FirebaseAuth
import GoogleSignIn

struct AuthDataResultModel{
    let uid: String
    let email: String?
    init(user: User){
        self.uid = user.uid
        self.email = user.email
    }
}

//@MainActor
class GoogleSignInHelper{
    static func signIn() async throws -> AuthDataResultModel {
            // 1. Tìm ViewController đang hiển thị để đè cửa sổ Google lên
            guard let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                  let rootVC = scene.windows.first?.rootViewController else {
                throw NSError(domain: "ViewError", code: 0)
            }
            
            // 2. Bắt đầu đăng nhập Google
            let result = try await GIDSignIn.sharedInstance.signIn(withPresenting: rootVC)
            
            // 3. Lấy thông tin Token
            guard let idToken = result.user.idToken?.tokenString else {
                throw NSError(domain: "TokenError", code: 0)
            }
            let accessToken = result.user.accessToken.tokenString
            
            // 4. Xác thực với Firebase
            let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: accessToken)
            let authResult = try await Auth.auth().signIn(with: credential)
            
            return AuthDataResultModel(user: authResult.user)
        }
}


