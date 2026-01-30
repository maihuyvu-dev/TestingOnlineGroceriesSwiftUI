//
//  RoundButton.swift
//  TestingOnlineGroceriesSwiftUI
//
//  Created by Mai huy vu on 28/1/26.
//

import SwiftUI

struct RoundButton: View {
    
    @State var title: String
    
    var didTap: (()->())?
    
    var body: some View {
        Button{
            didTap?()
        }label: {
            Text(title)
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(Color.white)
                .multilineTextAlignment(.center)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 60, maxHeight: 60)
        .background(Color.green)
        .cornerRadius(20)
    }
}

#Preview {
    RoundButton(title: "Add to Basket")
}
