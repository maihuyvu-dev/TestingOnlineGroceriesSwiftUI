//
//  Extension.swift
//  TestingOnlineGroceriesSwiftUI
//
//  Created by Mai huy vu on 21/1/26.
//

import SwiftUI

extension Color {
    static var appDarkGray: Color {
        return Color("DarkGrayColor")
    }
    
    static var primaryAppColor: Color{
        return Color("LightGreenColor")
    }
    
    static var primaryTextColor: Color{
        return Color("PrimaryTextColor")
    }
}

extension CGFloat {
    static var topInsets: CGFloat {
            let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene
            return scene?.windows.first?.safeAreaInsets.top ?? 0
        }
    
    static var bottomInsets: CGFloat {
            let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene
            return scene?.windows.first?.safeAreaInsets.bottom ?? 0
        }
    
}

