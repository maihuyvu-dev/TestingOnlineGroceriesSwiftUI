//
//  FavouriteRow.swift
//  TestingOnlineGroceriesSwiftUI
//
//  Created by Mai huy vu on 28/1/26.
//

import SwiftUI
import SDWebImageSwiftUI

struct FavouriteRow: View {
    
    var favObj: ProductModel
    
    var body: some View {
        VStack{
            HStack{
                WebImage(url: URL(string: favObj.image))
                    .resizable()
                    .indicator(.activity)
                    .transition(.fade(duration: 0.5))
                    .scaledToFit()
                    .frame(width: 60, height: 60)
                
                VStack{
                    Text(favObj.name)
                        .font(.system(size: 16, weight: .bold))
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    
                    Text("\(favObj.unitValue)\(" ")\(favObj.unitName)")
                        .font(.system(size: 16, weight: .medium))
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                }
                
                Spacer()
                
                Text("$\(String(format: "%.2f",favObj.offerPrice ?? favObj.price))")
                    .padding(.trailing, 8)
            }
            
            Divider()
            
        }
    }
}

#Preview {
    FavouriteRow(favObj: ProductModel(
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
