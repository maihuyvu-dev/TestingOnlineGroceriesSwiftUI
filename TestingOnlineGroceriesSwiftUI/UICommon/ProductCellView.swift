import SwiftUI
import SDWebImageSwiftUI

struct ProductCellView: View {
    
    var product: ProductModel
    let onSelect: (ProductModel) -> Void
    //@State var isShowAlert: Bool = false
    //@State private var selectedProduct: ProductModel?
    
    var body: some View {
        ZStack {
            NavigationLink {
                // ProductCellViewDetail()
            } label: {
                VStack {
                    WebImage(url: URL(string: product.image)) { image in
                        image.resizable()
                    } placeholder: {
                        Image(systemName: "basket")
                            .font(.system(size: 40))
                            .foregroundColor(.gray)
                    }
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    
                    Spacer()
                    
                    Text(product.name)
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(.black)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    
                    Text("\(product.unitValue) \(product.unitName)")
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(.gray)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Spacer()
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text("$\(product.offerPrice ?? product.price, specifier: "%.2f")")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundStyle(Color.black)
                            
                            if let offer = product.offerPrice, offer < product.price {
                                Text("$\(product.price, specifier: "%.2f")")
                                    .font(.system(size: 14, weight: .medium))
                                    .foregroundColor(.gray)
                                    .strikethrough(true, color: .gray)
                            }
                        }

                        Spacer()
                        
                        // Nút Add
                        Button {
                            onSelect(product)
//                            self.selectedProduct = product
//                            self.isShowAlert = true // Sử dụng gán true cho chắc chắn
                        } label: {
                            Image(systemName: "plus") // Thay bằng icon của bạn
                                .resizable()
                                .scaledToFit()
                                .frame(width: 15, height: 15)
                                .foregroundColor(.white)
                        }
                        .frame(width: 35, height: 35)
                        .background(Color.green)
                        .cornerRadius(12)
                        // đặt nút "plus" này bên trong một một nút bấm khác(navigaitonLink) nên cần lệnh này để tách thành hai phần bấm riêng biệt
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .padding(15)
                .frame(width: 175, height: 250)
                .background(Color.white)
                .cornerRadius(18)
                .overlay(
                    RoundedRectangle(cornerRadius: 18)
                        .stroke(Color.gray.opacity(0.2), lineWidth: 1)
                )
            }
        }
//        // alert phải đặt ngoài navigationLink
//        .alert(isPresented: $isShowAlert) {
//            Alert(
//                title: Text("Xác nhận"),
//                message: Text("Bạn có chắc muốn thêm \(product.name) vào giỏ hàng không?"),
//                primaryButton: .default(Text("Đồng ý")) {
//                    if let product = selectedProduct {
//                        print("Đã thêm \(product.name) vào giỏ hàng")
//                        //CartViewModel.shared.addToCart(product: product)
//                    }
//                },
//                secondaryButton: .cancel(Text("Hủy"))
//            )
//        }
    }
}

#Preview {
    let mockProduct = ProductModel(
        id: 1,
        detail: "Fresh organic bananas from Ecuador.",
        name: "Organic Banana",
        unitName: "pcs",
        unitValue: "7",
        image: "https://media.istockphoto.com/id/173242750/vi/anh/bó-chuối.jpg?s=1024x1024&w=is&k=20&c=IN_UkHP76Ds4joBa6LfPZ1aM-xv2OsxlcS7Yqso7AxM=",
        offerPrice: 4.09,
        price: 4.99
    )
    
    // Thêm cặp ngoặc nhọn này vào sau onSelect
    ProductCellView(product: mockProduct) { product in
        print("Preview: Đã nhấn chọn sản phẩm \(product.name)")
    }
    .padding()
}
