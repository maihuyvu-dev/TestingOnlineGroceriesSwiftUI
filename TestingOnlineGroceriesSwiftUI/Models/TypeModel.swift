//
//  TypeModel.swift
//  TestingOnlineGroceriesSwiftUI
//
//  Created by Mai huy vu on 22/1/26.
//

import Foundation

struct TypeModel: Identifiable, Codable, Equatable {
    var id: Int
    var name: String
    var image: String
    
    enum CodingKeys: String, CodingKey {
        case id = "type_id"
        case name, image
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(Int.self, forKey: .id) ?? 0
        name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
        image = try container.decodeIfPresent(String.self, forKey: .image) ?? ""
    }
    
    init(id: Int = 0, name: String = "", image: String = "") {
        self.id = id
        self.name = name
        self.image = image
    }
}























//import Foundation
//
//struct TypeModel: Identifiable {
//    let id = UUID()
//    let typeId: Int
//    let name: String
//    let image: String
//
//    init(dict: NSDictionary) {
//        self.typeId = dict.value(forKey: "type_id") as? Int ?? 0
//        self.name = dict.value(forKey: "name") as? String ?? ""
//        self.image = dict.value(forKey: "image") as? String ?? ""
//    }
//}


