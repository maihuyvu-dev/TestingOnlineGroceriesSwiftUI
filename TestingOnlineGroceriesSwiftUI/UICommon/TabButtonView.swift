//
//  TabButtonView.swift
//  TestingOnlineGroceriesSwiftUI
//
//  Created by Mai huy vu on 22/1/26.
//

import SwiftUI

struct TabButtonView: View {
    
    @State var title: String
    @State var icon: String
    var isSelected: Bool
    var didSelect: (()->())    //báo là ngừoi dùng đã bấm rồi
    
    var body: some View {
        Button {
//            debugPrint("Tap Button Tap") // tức là người dùng ấn-> code chạy đến đây thì hiên lên Tap Button Tap trên console
            didSelect()
        } label: {
            VStack{
                Image(icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25)
                Text(title)
                    .font(.system(size: 14, weight: .semibold))
                    
            }
        }
        .foregroundColor(isSelected ? .green : .black )
        .frame(minWidth: 0, maxWidth: .infinity)
    }
}

#Preview {
    HStack {
        // Test trạng thái đang được chọn (isSelected = true)
        TabButtonView(
            title: "Shop",
            icon: "store_tab",
            isSelected: true
        ) {
            print("Nhấn vào tab Shop")
        }
        
        // Test trạng thái không được chọn (isSelected = false)
        TabButtonView(
            title: "Explore",
            icon: "explore_tab",
            isSelected: false
        ) {
            print("Nhấn vào tab Explore")
        }
    }
    .padding()
}
