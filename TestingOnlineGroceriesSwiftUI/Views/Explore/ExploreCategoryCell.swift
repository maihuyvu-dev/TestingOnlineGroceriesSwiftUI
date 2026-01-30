//
//  ExploreCategoryCell.swift
//  TestingOnlineGroceriesSwiftUI
//
//  Created by Mai huy vu on 28/1/26.
//

import SwiftUI
import SDWebImageSwiftUI

struct ExploreCategoryCell: View {
    
    var eObj: ExploreCategoryModel
    
    var body: some View {
        VStack{
            WebImage(url: URL(string: eObj.image))
                .resizable()
                .indicator(.activity)
                .transition(.fade(duration: 0.5))
                .scaledToFit()
                .frame(width: 120, height: 90)
            
            Text("\(eObj.name)")
                .font(.system(size: 20))
                .font(.caption)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
            
        }
        .padding(15)
        .background(eObj.color)
        .cornerRadius(16)
        .overlay (
            RoundedRectangle(cornerRadius: 16)
                .stroke(eObj.color, lineWidth: 1)
        )
        
    }
}

#Preview {
    ExploreCategoryCell(eObj: ExploreCategoryModel(
        id: 1,
        name: "Frest Fruits and Vegetables",
        image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQW8oe963gGEnd-I5O27ztgRBbYcPQXAlv-g&s",
        colorHex: "#F8A44C"
        ))
}
