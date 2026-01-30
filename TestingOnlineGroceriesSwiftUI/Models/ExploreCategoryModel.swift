//
//  ExploreCategoryModel.swift
//  TestingOnlineGroceriesSwiftUI
//
//  Created by Mai huy vu on 28/1/26.
//

import SwiftUI

class ExploreCategoryModel: Codable, Identifiable, Equatable {
    var id: Int = 0
    var name: String = ""
    var image: String = ""
    var colorHex: String = ""
    
    enum CodingKeys: String, CodingKey {
        case id = "cat_id"
        case name = "cat_name"
        case image = "image"
        case colorHex = "color"
    }
    
    var color: Color {
        return Color(colorHex)
    }
    
    init(id: Int, name: String, image: String, colorHex: String) {
            self.id = id
            self.name = name
            self.image = image
            self.colorHex = colorHex
    }
    
    // 5. Hàm Equatable để so sánh 2 Category, chưa biết làm gì:)?
    static func == (lhs: ExploreCategoryModel, rhs: ExploreCategoryModel) -> Bool {
        return lhs.id == rhs.id
    }
}
