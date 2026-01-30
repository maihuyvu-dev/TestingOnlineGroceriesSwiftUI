//
//  SignInView.swift
//  TestingOnlineGroceriesSwiftUI
//
//  Created by Mai huy vu on 21/1/26.
//

import SwiftUI

struct SignInView: View {
    var body: some View {
        ZStack{
            Image("signin_pic1")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()
            
            VStack{
                Image("signin_pic2")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .ignoresSafeArea()
                Spacer()
            }
            
            ScrollView{
                VStack(alignment: .leading){
                    Text( "Get your groceries\nwith nectar")
                        .font(.system(size: 30, weight: .bold))
                        .foregroundColor(.primaryText)
                        .multilineTextAlignment(.leading)
                        .padding(.bottom , 25)
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                
                NavigationLink{
                    LoginGoogleView()
                } label: {
                    Text("Continue with Google Sign In")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                }
                .frame( minWidth: 0, maxWidth: .infinity, minHeight: 60, maxHeight: 60 )
                .background( Color.blue)
                .cornerRadius(20)
                .padding(.bottom, 8 )
            }
            .padding(.top , 400)
            
        }
    }
}

#Preview {
    SignInView()
}
