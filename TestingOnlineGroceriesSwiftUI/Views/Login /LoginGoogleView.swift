//
//  LoginGoogleView.swift
//  TestingOnlineGroceriesSwiftUI
//
//  Created by Mai huy vu on 22/1/26.
//

import SwiftUI

struct LoginGoogleView: View {
    @StateObject var mainVM = MainViewModel.shared
    @Environment(\.dismiss) var dismiss // Để quay lại nếu người dùng hủy đăng nhập
    
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            
            VStack(spacing: 20) {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                    .scaleEffect(2)
                
                Text("Connecting to Google...")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.gray)
            }
        }
        .onAppear {
            // Tự động gọi bảng đăng nhập Google khi màn hình hiện lên
            mainVM.signInWithGoogle()
        }
        .onChange(of: mainVM.isUserLogin) { newValue in
            if newValue {
                // Nếu đăng nhập thành công, logic ở App entry sẽ tự chuyển sang HomeView
            }
        }
        .alert(isPresented: $mainVM.showError) {
            Alert(
                title: Text("Login Error"),
                message: Text(mainVM.errorMessage),
                dismissButton: .default(Text("Try Again"), action: {
                    dismiss() // Quay lại màn hình SignInView để thử lại
                })
            )
        }
        .navigationBarBackButtonHidden(true) // Ẩn nút back để tránh ngắt quãng quá trình login
    }
}
