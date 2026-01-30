//
//  ContentView.swift
//  TestingOnlineGroceriesSwiftUI
//
//  Created by Mai huy vu on 21/1/26.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var homeVM = HomeViewModel.shared
    @State var isShowAlert: Bool = false
    @State private var selectedProduct: ProductModel?
    
    var body: some View {
        NavigationStack{
            ZStack{
                ScrollView{
                    VStack{
                        Image(systemName: "carrot")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25)
                        
                        HStack{
                            Image(systemName: "location.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 16, height: 16 )
                            
                            Text("Dhaka, Banassre")
                                .font(.system(size: 18, weight: .semibold))
                                .foregroundColor(.appDarkGray)
                        }
                        
                        //view cho thanh tìm kiếm
                        SearchTextFieldView(placeHolder: "Search Store", txt: $homeVM.txtSearch)
                            .padding(.horizontal, 15)
                            .padding(.vertical ,10)
                    }
                    //.padding(.top, .topInsets )
                    
                    Image("banner_top")
                        .resizable()
                        .scaledToFill()
                        .frame(height: 115)
                        .padding(.horizontal, 20)
                    
                    SectionTitleView(
                        title: "Exclusive Offer",
                        titleAll: homeVM.isViewAllOffer ? "Close" : "View all",
                        isViewAll: homeVM.isViewAllOffer
                    ){
                        //nếu bấm View all
                        withAnimation{
                            homeVM.isViewAllOffer.toggle()
                        }
                        
                    }
                    
                    ScrollView(.horizontal, showsIndicators: false){
                        if homeVM.isViewAllOffer{
                            LazyHStack{
                                ForEach(homeVM.offerArr, id: \.id){ pObj in
                                    ProductCellView(product: pObj, onSelect: { product in
                                        // showAlert()
                                        isShowAlert = true
                                        selectedProduct = product
                                    })
                                }
                            }
                        }
                    }
                    //Text("Debug: Đang có \(homeVM.bestArr.count) sản phẩm")
                    SectionTitleView(
                        title: "Best Selling",
                        titleAll: homeVM.isViewAllBest ? "Close" : "View all",
                        isViewAll: homeVM.isViewAllBest
                    ){
                        //nếu bấm View all
                        withAnimation{
                            homeVM.isViewAllBest.toggle()
                        }
                    }
                    
                    ScrollView(.horizontal, showsIndicators: false){
                        if homeVM.isViewAllBest{
                            LazyHStack{
                                ForEach(homeVM.bestArr, id: \.id){ pObj in
                                    ProductCellView(product: pObj, onSelect: { product in
                                        isShowAlert = true
                                        selectedProduct = product
                                    })
                                }
                            }
                        }
                    }
                    
                    SectionTitleView(
                        title: "Groceries",
                        titleAll: homeVM.isViewAllGroceries ? "Close" : "View all",
                        isViewAll: homeVM.isViewAllGroceries
                    ){
                        //nếu bấm View all
                        withAnimation{
                            homeVM.isViewAllGroceries.toggle()
                        }
                    }
                    
                    ScrollView(.horizontal, showsIndicators: false){
                        if homeVM.isViewAllGroceries{
                            LazyHStack{
                                ForEach(homeVM.listArr, id: \.id){ pObj in
                                    ProductCellView(product: pObj, onSelect: { product in
                                        isShowAlert = true
                                        selectedProduct = product
                                    })
                                }
                            }
                        }
                    }
                    .alert(isPresented: $isShowAlert) {
                        Alert(
                            title: Text("Xác nhận"),
                            message: Text("Bạn có chắc muốn thêm \(selectedProduct?.name ?? "") vào giỏ hàng không?"),
                            primaryButton: .default(Text("Đồng ý")) {
                                if let product = selectedProduct {
                                    print("Đã thêm \(product.name) vào giỏ hàng")
                                    //CartViewModel.shared.addToCart(product: product)
                                }
                            },
                            secondaryButton: .cancel(Text("Hủy"))
                        )
                    }
                    }
                }
            }
        }
    }


#Preview {
    HomeView()
}
