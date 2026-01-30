//
//  ExploreViewModel.swift
//  TestingOnlineGroceriesSwiftUI
//
//  Created by Mai huy vu on 28/1/26.
//

import Foundation
import Combine

class ExploreViewModel: ObservableObject{
    static var shared = ExploreViewModel()
    
    @Published var txtSearch: String = ""
    @Published var listArr: [ExploreCategoryModel] = []
    
    private init(){
        serviceCallList()
    }
    
    func serviceCallList() {
            // Chốt chặn để không nạp lặp
            guard listArr.isEmpty else { return }
            
            guard let url = Bundle.main.url(forResource: "home_data", withExtension: "json") else {
                print("❌ Explore: Không tìm thấy file JSON")
                return
            }
            
            do {
                
                // Định nghĩa cấu trúc hứng dữ liệu tạm thời
                struct HomeResponse: Codable {
                    let status: String
                    let message: String?
                    let payload: HomePayload?
                }
                
                struct HomePayload: Codable {
                    let category_list: [ExploreCategoryModel]?
                    let offer_list: [ProductModel]?
                    let best_sell_list: [ProductModel]?
                    let list: [ProductModel]?
                    let type_list: [TypeModel]?
                }
                
                // 2. Đọc dữ liệu thô từ file
                let data = try Data(contentsOf: url)
                
                // 3. Decode dữ liệu sang HomeResponse
                let response = try JSONDecoder().decode(HomeResponse.self, from: data)
                
                DispatchQueue.main.async {
                    if response.status == "1", let payload = response.payload {
                        // 4. Lấy danh sách category từ payload mới
                        self.listArr = payload.category_list ?? []
                        
                        print("✅ Explore: Đã nạp thành công \(self.listArr.count) danh mục")
                    } else {
                        print("⚠️ Explore: Payload trống hoặc lỗi status")
                    }
                }
            } catch {
                print("❌ Explore Decode Error: \(error)")
            }
        }
}
