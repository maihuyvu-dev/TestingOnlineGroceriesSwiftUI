//
//  FavouriteViewModel.swift
//  TestingOnlineGroceriesSwiftUI
//
//  Created by Mai huy vu on 28/1/26.
//
import Foundation
import Combine

// 1. Mang các struct Response ra ngoài để Decoder có thể nhìn thấy toàn cục
struct HomeResponse: Codable {
    let status: String
    let message: String?
    let payload: HomePayload?
}

struct HomePayload: Codable {
    let offer_list: [ProductModel]?
    let best_sell_list: [ProductModel]?
    let list: [ProductModel]?
    let type_list: [TypeModel]?
}

class FavouriteViewModel: ObservableObject {
    static let shared = FavouriteViewModel()
    
    @Published var listArr : [ProductModel] = []
    @Published var errorMessage: String = ""
    @Published var showError: Bool = false
    
    // ... các phần còn lại giữ nguyên
    
    private init(){
        print("🚀 ViewModel khởi tạo - Nạp dữ liệu từ JSON")
        serviceCallList()
    }
    
    func serviceCallList() {
        if !listArr.isEmpty { return }
        
        // 1. Kiểm tra chính xác tên file (phải khớp 100% với tên file trong Xcode)
        guard let url = Bundle.main.url(forResource: "home_data", withExtension: "json") else {
            print("❌ Lỗi: Không tìm thấy file home_data.json trong Bundle")
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let response = try decoder.decode(HomeResponse.self, from: data)
            
            DispatchQueue.main.async {
                if response.status == "1", let payload = response.payload {
                    // Gộp hết lại để kiểm tra xem có dữ liệu không
                    let allProducts = (payload.list ?? []) + (payload.offer_list ?? []) + (payload.best_sell_list ?? [])
                    
                    // Lọc những món có isFav = true (is_fav: 1 trong JSON)
                    self.listArr = allProducts.filter { $0.isFav }
                    
                    print("✅ Đã nạp thành công: \(self.listArr.count) sản phẩm yêu thích")
                }
            }
        } catch {
            print("❌ Lỗi Decode: \(error)")
        }
    }
}
