//
//  FavouriteView.swift
//  TestingOnlineGroceriesSwiftUI
//
//  Created by Mai huy vu on 28/1/26.
//


//dữ liệu hiển thị có thể ko thấy tuy nhiên chạy simulator vẫn ổn ko sao , hoặc có thể test favouriteView ở MainTabView
import SwiftUI

struct FavouriteView: View {
    
    @StateObject var favVM = FavouriteViewModel.shared
    
    var body: some View {
        ZStack{
            VStack{
                Text("Favourites")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(Color.black)
                    .frame(height: 46)
                
                Divider()
                
                ScrollView{
                    LazyVStack{
                        ForEach(favVM.listArr, id: \.id) { fObj in
                            FavouriteRow(favObj: fObj)
                        }
                    }
                }
                .padding(10)
            }
            .padding(.top, .topInsets)
            .padding(.bottom, .bottomInsets + 60)
            
            VStack{
                
                Spacer()
                
                RoundButton(title: "Add all to cart"){
                    //thêm tât cả vào cart
                }
                    .padding(.horizontal, 20)
                    .padding(.bottom, .bottomInsets + 60)
            }
            
        }
        .ignoresSafeArea()
    }
}

#Preview {
    FavouriteView()
}
