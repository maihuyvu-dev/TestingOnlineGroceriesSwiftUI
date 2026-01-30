//
//  ProductDetailViewModel.swift
//  TestingOnlineGroceriesSwiftUI
//
//  Created by Mai huy vu on 27/1/26.
//

import Foundation
import Combine

class ProductDetailViewModel: ObservableObject {
    
    @Published var pObj: ProductModel?
    @Published var isFav: Bool = false
    @Published var qty: Int = 1
    @Published var isShowDetail: Bool = false
    @Published var isShowNutrition: Bool = false
    
    @Published var showError = false
    @Published var errorMessage = ""
    
    
    init(pObj: ProductModel? = nil) {
        self.pObj = pObj
        //fetchLocalDetail()
    }
    
    func actionFav(){
        isFav.toggle()
        
        pObj?.isFav = isFav
        
        //thêm vào mục yêu thích
    }
    
    func countQty(isAdd: Bool){
        if( isAdd ){
            qty = min(qty+1, 9)
        } else {
            qty = max(1, qty-1 )
        }
    }
    
    func showDetail(){
        isShowDetail.toggle()
    }
    
    func showNutrition(){
        isShowNutrition.toggle()
    }
    
//    func fetchLocalDetail() {
//        // Tìm đường dẫn file trong project
//        guard let url = Bundle.main.url(forResource: "home_data", withExtension: "json") else { return }
//        
//        do {
//            let data = try Data(contentsOf: url)
//            let detailData = try JSONDecoder().decode(ProductModel.self, from: data)
//            self.pObj = detailData
//        } catch {
//            print("Lỗi đọc file JSON: \(error)")
//        }
//    }
    
}
