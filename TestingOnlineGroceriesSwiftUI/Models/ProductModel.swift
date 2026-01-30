//
//  ProductModel.swift
//  TestingOnlineGroceriesSwiftUI
//
//  Created by Mai huy vu on 22/1/26.
//
import Foundation

struct ProductModel: Identifiable, Codable, Equatable {
    var id: Int
    //var prodId: Int
    var catId: Int
    var brandId: Int
    var typeId: Int
    var orderId: Int
    var qty: Int
    var detail: String
    var name: String
    var unitName: String
    var unitValue: String
    var nutritionWeight: String
    var image: String
    var catName: String
    var typeName: String
    var offerPrice: Double?
    var itemPrice: Double
    var totalPrice: Double
    var price: Double
    var isFav: Bool
    var avgRating: Int

    enum CodingKeys: String, CodingKey {
        case id = "prod_id"
        case catId = "cat_id"
        case brandId = "brand_id"
        case typeId = "type_id"
        case orderId = "order_id"
        case qty
        case isFav = "is_fav"
        case detail, name, image, price
        case unitName = "unit_name"
        case unitValue = "unit_value"
        case nutritionWeight = "nutrition_weight"
        case catName = "cat_name"
        case typeName = "type_name"
        case offerPrice = "offer_price"
        case itemPrice = "item_price"
        case totalPrice = "total_price"
        case avgRating = "avg_rating"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decodeIfPresent(Int.self, forKey: .id) ?? 0
        catId = try container.decodeIfPresent(Int.self, forKey: .catId) ?? 0
        brandId = try container.decodeIfPresent(Int.self, forKey: .brandId) ?? 0
        typeId = try container.decodeIfPresent(Int.self, forKey: .typeId) ?? 0
        orderId = try container.decodeIfPresent(Int.self, forKey: .orderId) ?? 0
        qty = try container.decodeIfPresent(Int.self, forKey: .qty) ?? 0
        
        detail = try container.decodeIfPresent(String.self, forKey: .detail) ?? ""
        name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
        unitName = try container.decodeIfPresent(String.self, forKey: .unitName) ?? ""
        unitValue = try container.decodeIfPresent(String.self, forKey: .unitValue) ?? ""
        nutritionWeight = try container.decodeIfPresent(String.self, forKey: .nutritionWeight) ?? ""
        image = try container.decodeIfPresent(String.self, forKey: .image) ?? ""
        catName = try container.decodeIfPresent(String.self, forKey: .catName) ?? ""
        typeName = try container.decodeIfPresent(String.self, forKey: .typeName) ?? ""
        
        price = try container.decodeIfPresent(Double.self, forKey: .price) ?? 0.0
        offerPrice = try container.decodeIfPresent(Double.self, forKey: .offerPrice)
        itemPrice = try container.decodeIfPresent(Double.self, forKey: .itemPrice) ?? 0.0
        totalPrice = try container.decodeIfPresent(Double.self, forKey: .totalPrice) ?? 0.0
        
        // Xử lý logic is_fav từ Int sang Bool
        let favInt = try container.decodeIfPresent(Int.self, forKey: .isFav) ?? 0
        isFav = favInt == 1
        
        let ratingDouble = try container.decodeIfPresent(Double.self, forKey: .avgRating) ?? 0.0
        avgRating = Int(ratingDouble)
    }
    
    // Init thủ công phục vụ Preview
    init(id: Int = 0, catId: Int = 0, brandId: Int = 0, typeId: Int = 0, orderId: Int = 0, qty: Int = 0, detail: String = "", name: String = "", unitName: String = "", unitValue: String = "", nutritionWeight: String = "", image: String = "", catName: String = "", typeName: String = "", offerPrice: Double? = nil, itemPrice: Double = 0.0, totalPrice: Double = 0.0, price: Double = 0.0, isFav: Bool = false, avgRating: Int = 0) {
        self.id = id
        self.catId = catId
        self.brandId = brandId
        self.typeId = typeId
        self.orderId = orderId
        self.qty = qty
        self.detail = detail
        self.name = name
        self.unitName = unitName
        self.unitValue = unitValue
        self.nutritionWeight = nutritionWeight
        self.image = image
        self.catName = catName
        self.typeName = typeName
        self.offerPrice = offerPrice
        self.itemPrice = itemPrice
        self.totalPrice = totalPrice
        self.price = price
        self.isFav = isFav
        self.avgRating = avgRating
    }
}
