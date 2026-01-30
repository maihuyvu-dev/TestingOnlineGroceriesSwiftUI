//
//  MainTabView.swift
//  TestingOnlineGroceriesSwiftUI
//
//  Created by Mai huy vu on 22/1/26.
//

import SwiftUI

@MainActor
struct MainTabView: View {
    
    @StateObject var homeVM = HomeViewModel.shared
    
    var body: some View {
        ZStack{
            //quản lý HomeView()
            if homeVM.selectedTab == 0 {
                HomeView()
            }else if(homeVM.selectedTab == 1) {
                ExploreView()
            }else if(homeVM.selectedTab == 2) {
                //CartView()
            }else if(homeVM.selectedTab == 3) {
                FavouriteView()
            }else if(homeVM.selectedTab == 4) {
                //AccountView()
            }
            
            VStack{
                Spacer()
                
                HStack{
                    TabButtonView(title: "Shop", icon: "store_tab", isSelected: homeVM.selectedTab == 0) {
                        homeVM.selectedTab = 0
                    }
                    
                    TabButtonView(title: "Explore", icon : "explore_tab", isSelected: homeVM.selectedTab == 1) {
                        homeVM.selectedTab = 1
                    }
                    
                    TabButtonView(title: "Cart", icon : "cart_tab", isSelected: homeVM.selectedTab == 2) {
                        homeVM.selectedTab = 2
                    }
                    
                    TabButtonView(title: "Favourite", icon : "favourite_tab", isSelected: homeVM.selectedTab == 3) {
                        homeVM.selectedTab = 3
                    }
                    
                    TabButtonView(title: "Account", icon : "account_tab", isSelected: homeVM.selectedTab == 4) {
                        homeVM.selectedTab = 4
                    }
                }
            }
        }
    }
}

#Preview {
    MainTabView()
}
