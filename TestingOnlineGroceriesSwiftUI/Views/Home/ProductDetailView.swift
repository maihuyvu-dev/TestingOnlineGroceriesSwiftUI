//
//  ProductDetailView.swift
//  TestingOnlineGroceriesSwiftUI
//
//  Created by Mai huy vu on 27/1/26.
//

import SwiftUI
import SDWebImageSwiftUI

struct ProductDetailView: View {
    
    @StateObject var detailVM = ProductDetailViewModel()
    
    //dữ liệu từ homeView sẽ truyền vào đây( quả chuối: productMode), nếu muốn truyền thông tin quả chuối này vào ProductDetailViewModel để thực hiện các lệnh bên trong đó thì phải dùng hàm init sau:
    var pObj: ProductModel
    
    init(pObj: ProductModel) {
        self.pObj = pObj // Gán vào biến của View
        
        // ĐÂY LÀ BƯỚC QUAN TRỌNG:
        // Khởi tạo ViewModel và đưa pObj vào trong lòng nó
        _detailVM = StateObject(wrappedValue: ProductDetailViewModel(pObj: pObj))
    }
    
    var body: some View {
        ZStack {
            GeometryReader { geo in
                ScrollView {
                    ZStack {
                        Rectangle()
                            .foregroundColor( Color.gray.opacity(0.1))
                            .frame(width: geo.size.width, height: geo.size.width * 0.8)
                            .clipShape(
                                .rect(
                                    bottomLeadingRadius: 20,
                                    bottomTrailingRadius: 20
                                )
                            )
                        
                        WebImage(url: URL(string: detailVM.pObj?.image ?? ""))
                            .resizable()
                            .indicator(.activity) //nếu chưa có ảnh thì hiện thị màn hình xoay
                            .transition(.fade(duration: 0.5))
                            .scaledToFit()//ảnh sẻ fit với cái frame bên dưới
                            .frame(width: geo.size.width, height: geo.size.width * 0.8)
                    }
                    .frame(width: geo.size.width, height: geo.size.width * 0.8)
                    
                    VStack() {
                        
                        Divider()
                        
                        HStack(){
                            Text(detailVM.pObj?.name ?? "")
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                .font(.system(size: 24, weight: .bold))
                                .foregroundColor(Color.black)
                            
                            Button{
                                detailVM.actionFav()
                            } label: {
                                Image(detailVM.isFav ? "favourite.fill" :"favourite")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 35, height: 35)
                            }
                            .foregroundColor(Color.yellow)
                        }
                        
                        Text("\(detailVM.pObj?.unitValue ?? "0")\(detailVM.pObj?.unitName ?? ""), Price")
                            .font(.system(size: 16, weight: .regular))
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        
                        HStack{
                            Button{
                                detailVM.countQty(isAdd: false)
                            }label: {
                                Image("subtrack")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20, height: 20)
                                    .padding(10)
                            }
                            
                            
                            Text("\(detailVM.qty)")
                                .font(.system(size: 16, weight: .semibold))
                                .frame(width: 45, height: 45)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 16)
                                        .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                                )
                            
                            Button{
                                detailVM.countQty(isAdd: true)
                            }label: {
                                Image("green_add")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20, height: 20)
                                    .padding(10)
                            }
                            
                            Spacer()
                            
                            Text("$\( (detailVM.pObj?.offerPrice ?? (detailVM.pObj?.price ?? 0) ) * Double(detailVM.qty),specifier:  "%.2f" )")
                                .font(.system(size: 35, weight: .bold))
                            
                        }
                        .padding(.vertical, 8)
                        
                        Divider()
                        
                        VStack{
                            HStack{
                                Text("Product detail")
                                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                    .font(.system(size: 16, weight: .semibold))
                                
                                Button{
                                    withAnimation{
                                        detailVM.showDetail()
                                    }
                                }label: {
                                    Image(systemName: detailVM.isShowDetail ? "chevron.down" : "chevron.right")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 20, height: 20)
                                        .foregroundColor(Color.black)
                                }
                            }
                            .padding(.vertical, 8)
                            
                            if(detailVM.isShowDetail){
                                Text(detailVM.pObj?.detail ?? "")
                                    .font(.system(size: 13, weight: .medium))
                                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            }
                            
                            Divider()
                            
                        }
                        
                        VStack{
                            HStack{
                                Text("Nutritions")
                                    .font(.system(size: 16, weight: .medium))
                                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                
                                Text(detailVM.pObj?.nutritionWeight ?? "")
                                
                                Button{
                                    detailVM.showNutrition()
                                }label: {
                                    Image(systemName: detailVM.isShowNutrition ? "chevron.down" : "chevron.right" )
                                        .resizable()
                                        .scaledToFit()
                                        .foregroundColor(Color.black)
                                        .frame(width: 20, height: 20)
                                }
                            }
                            
                            Divider()
                                .padding(7)
                        }
                        
                        HStack{
                            Text("Review")
                                .font(.system(size: 16, weight: .medium))
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            
                            ForEach(1...5, id: \.self) { index in
                                Image(systemName: "star.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 15, height: 15)
                                    .foregroundColor(index <= detailVM.pObj?.avgRating ?? 0 ? Color.orange : Color.gray)
                                    
                            }
                            
                            Button{
                                
                            }label: {
                                Image(systemName: "chevron.right")
                                    .resizable()
                                    .scaledToFit()
                                    .foregroundColor(Color.black)
                                    .frame(width: 20, height: 20)
                            }
                        }
                    }
                    .padding(.horizontal, 15)
                    
                    
                    RoundButton(title: "Add to Basket"){
                        //add to Cart
                    }
                    .padding(20)
                }
            }
        }
    }
}

#Preview {
    ProductDetailView(pObj: ProductModel(
        id: 1,
        catId: 1,
        brandId: 1,
        typeId: 1,
        orderId: 1,
        qty: 1,
        detail: "Nước giải khát Diet Coke là sự lựa chọn hoàn hảo cho những người yêu thích hương vị nguyên bản của Coca-Cola nhưng muốn cắt giảm hoàn toàn lượng đường và calo. Với công thức đặc biệt mang lại cảm giác sảng khoái tức thì, Diet Coke giúp bạn giải tỏa cơn khát mà không lo ảnh hưởng đến chế độ ăn kiêng hay cân nặng. Sản phẩm đóng lon tiện dụng, giữ được độ gas mạnh mẽ, ngon hơn khi uống lạnh. Đây là người bạn đồng hành lý tưởng cho các bữa tiệc, các buổi dã ngoại hoặc đơn giản là để tiếp thêm hứng khởi cho ngày làm việc của bạn.",
        name: "Organic Banana",
        unitName: "pcs",
        unitValue: "7",
        nutritionWeight: "200g",
        image: "https://media.istockphoto.com/id/173242750/vi/anh/bó-chuối.jpg?s=1024x1024&w=is&k=20&c=IN_UkHP76Ds4joBa6LfPZ1aM-xv2OsxlcS7Yqso7AxM=",
        catName: "Fruits",
        typeName: "Organic",
        offerPrice: 2.49,
        itemPrice: 4.99,
        totalPrice: 4.99,
        price: 4.99,
        isFav: false,
        avgRating: 4
    ))
}
