//
//  SectionTitleView.swift
//  TestingOnlineGroceriesSwiftUI
//
//  Created by Mai huy vu on 22/1/26.
//

import SwiftUI

struct SectionTitleView: View {
    
    let title: String
    let titleAll: String
    let isViewAll : Bool
    var didSelect: (()->())
    
    var body: some View {
        HStack(){
            Text(title)
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(.black)
            
            Spacer()
            
            Button {
                didSelect()
            } label: {
                Text(titleAll)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(isViewAll ? .black : .green)
            }
        }
        .padding(.horizontal, 15)
    }
}

#Preview {
    VStack{
        SectionTitleView(
            title: "Exclusive Offer",
            titleAll: "View all ",
            isViewAll: true
        ) {
            print("tab view all is selected")
        }
        
        SectionTitleView(
            title: "Exclusive Offer",
            titleAll: "View all ",
            isViewAll: false
        ) {
            print("tab view all is not selected")
        }
    }
    
    
    
}
