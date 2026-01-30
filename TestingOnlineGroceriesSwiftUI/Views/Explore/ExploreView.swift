//
//  ExploreView.swift
//  TestingOnlineGroceriesSwiftUI
//
//  Created by Mai huy vu on 28/1/26.
//

import SwiftUI

struct ExploreView: View {
    
    @StateObject var exploreVM = ExploreViewModel.shared
    
    var columns = [
        GridItem(.flexible(), spacing: 15),
        GridItem(.flexible(), spacing: 15)
    ]
    
    var body: some View {
        NavigationStack{
            ZStack{
                VStack{
                    HStack{
                        Text("Find Products")
                            .font(.system(size: 20, weight: .bold))
                            .frame(height: 46)
                    }
                    .padding(.top, .topInsets)
                    
                    //@State var txtSearch: String = ""
                    //TextField("Search store", text: $txtSearch)
                    SearchTextFieldView(placeHolder: "Search store", txt: $exploreVM.txtSearch)
                        .padding(.horizontal, 20)
                        
                    ScrollView{
                        LazyVGrid(columns: columns, spacing: 20){
                            ForEach(exploreVM.listArr, id: \.id){ eObj in
                                NavigationLink(destination:
                                    ExploreItemsView()
                                ){
                                    //view của một category
                                    ExploreCategoryCell(eObj: eObj)
                                }
                            }
                        }
                    }
                }
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
        ExploreView()
    
}
