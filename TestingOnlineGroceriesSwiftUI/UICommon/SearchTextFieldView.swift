//
//  SearchTextField.swift
//  TestingOnlineGroceriesSwiftUI
//
//  Created by Mai huy vu on 21/1/26.
//

import SwiftUI

struct SearchTextFieldView: View {
    
    @State var placeHolder: String
    @Binding var txt: String
    
    var body: some View{
        HStack(spacing: 15){
            Image(systemName: "magnifyingglass")
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
            
            TextField(placeHolder, text: $txt)
                .autocorrectionDisabled(true)
                .autocapitalization(.none)
            
        }
        .padding(10)
        .frame(height: 50)
        .background(Color.gray.opacity(0.1))
        .cornerRadius(16)
        
    }
    
    
    
    
    
//    @State var placeHolder: String
//    @Binding var txt: String
//    
//    var body: some View {
//        HStack(spacing: 15){
//            Image(systemName: "magnifyingglass")
//                .resizable()
//                .scaledToFit()
//                .frame(width: 20, height: 20)
//            
//            TextField(placeHolder, text: $txt)
//                .font(.system(size: 17))
//                .autocapitalization(.none)
//                .autocorrectionDisabled(true)
//        }
//        .frame(height: 30)
//        .padding(10)  //căn lề nội dung ko ảnh hưởng đến khung frame
//        .background(.gray.opacity(0.1))
//        .cornerRadius(16)
//    }
}

#Preview {
    @Previewable @State var txt: String = ""
    SearchTextFieldView(placeHolder: "Search Store", txt: $txt)
}
