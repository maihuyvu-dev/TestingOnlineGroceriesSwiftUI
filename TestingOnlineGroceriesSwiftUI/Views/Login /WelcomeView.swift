//
//  WelcomeView.swift
//  TestingOnlineGroceriesSwiftUI
//
//  Created by Mai huy vu on 21/1/26.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        ZStack{
            Image("welcome_pic")
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea() //ảnh tràn ra phần tai thỏ
            
            VStack{
                Spacer()
                
                Image(systemName: "carrot")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60)
                    .padding(.bottom, 8)
                
                Text("Welcome \nto our store")
                    .font(.system(size: 40, weight: .semibold))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                
                Text( "Ger your groceries in as fast as one hour")
                    .font(.system(size: 30, weight: .medium))
                    .foregroundColor(.white.opacity(0.7))
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 30)
                
                NavigationLink{
                    SignInView()
                } label: {
                    Text("Get Started")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                }
                .frame( minWidth: 0, maxWidth: .infinity, minHeight: 60, maxHeight: 60 )
                .background(Color.primaryAppColor)
                .cornerRadius(20)
                
                Spacer()
                    .frame(height: 80)
            }
            .padding(.horizontal, 20)
        }
    }
}

#Preview {
    NavigationStack{
        WelcomeView()
    }
}
