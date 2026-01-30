import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    static let shared = HomeViewModel()
    
    @Published var txtSearch: String = ""
    @Published var selectedTab: Int = 0         //quản lý các chức năng tabbar ở dưới trong MaintabView
    @Published var isViewAllOffer: Bool = false      // quản lý nút View all của Offensive Offer có đc bấm không trong HomeView()
    @Published var isViewAllBest: Bool = false //quản lý nút View All của Bestselling có được bấm khôgn trong HomeView()
    @Published var isViewAllGroceries: Bool = false //quản lý nút View All của Groceríe có được bấm không trong HomeView()
    
    @Published var showError: Bool = false
    @Published var errorMessage: String = ""
    
    // 4. Các kho chứa dữ liệu (Sẽ đổ dữ liệu từ JSON vào đây)
    @Published var offerArr: [ProductModel] = []
    @Published var bestArr: [ProductModel] = []
    @Published var listArr: [ProductModel] = []
    @Published var typeArr: [TypeModel] = []
    
    init() {
        serviceCallList()
    }
    
    func serviceCallList() {
//            guard let url = Bundle.main.url(forResource: "home_data", withExtension: "json") else {
//                return
//            }
        
        // 1. Xác định đường dẫn file trong dự án
        guard let url = Bundle.main.url(forResource: "home_data", withExtension: "json") else {
            self.errorMessage = "Không tìm thấy file HomeData.json"
            self.showError = true
            return
        }
        
        do {
            // 2. Đọc dữ liệu thô từ file
            let data = try Data(contentsOf: url)
            
            // 3. Chuyển đổi dữ liệu bằng JSONDecoder (Thay thế NSDictionary cũ)
            let decoder = JSONDecoder()
            
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
            
            let response = try decoder.decode(HomeResponse.self, from: data)
            
            // Dispatch về Main thread để cập nhật giao diện
            DispatchQueue.main.async {
                // 4. Kiểm tra status (giống hệt logic gọi API thật)
                if response.status == "1" {
                    if let payload = response.payload {
                        
                        // Map Exclusive Offers
                        self.offerArr = payload.offer_list ?? []
                        
                        // Map Best Selling
                        self.bestArr = payload.best_sell_list ?? []
                        
                        // Map List (Groceries)
                        self.listArr = payload.list ?? []
                        
                        // Map Types
                        self.typeArr = payload.type_list ?? []
                    }
                } else {
                    self.errorMessage = response.message ?? "Fail"
                    self.showError = true
                }
            }
        } catch let decodingError as DecodingError {
            // Đây là chìa khóa để biết chính xác lỗi ở đâu
            switch decodingError {
            case .typeMismatch(let type, let context):
                print("❌ Lỗi kiểu dữ liệu: Kỳ vọng kiểu \(type) nhưng JSON trả về kiểu khác tại \(context.codingPath)")
            case .valueNotFound(let type, let context):
                print("❌ Lỗi thiếu giá trị: Không tìm thấy giá trị cho kiểu \(type) tại \(context.codingPath)")
            case .keyNotFound(let key, let context):
                print("❌ Lỗi sai Key: Không tìm thấy Key '\(key.stringValue)' tại \(context.codingPath)")
            case .dataCorrupted(let context):
                print("❌ Lỗi file JSON bị hỏng: \(context.debugDescription)")
            @unknown default:
                print("❌ Lỗi không xác định khi Decode")
            }
        } catch {
            print("❌ Lỗi khác: \(error.localizedDescription)")
        }
    }
}
