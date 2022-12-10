//
//  Extension.swift
//  mountain
//
//  Created by gonzo_li on 2022/12/3.
//

import SwiftUI

// 顏色
public extension Color {
    
    static let lightText = Color(UIColor.lightText)
    static let darkText = Color(UIColor.darkText)
    static let darkGray = Color(UIColor.darkGray)

    static let label = Color(UIColor.label)
    static let secondaryLabel = Color(UIColor.secondaryLabel)
    static let tertiaryLabel = Color(UIColor.tertiaryLabel)
    static let quaternaryLabel = Color(UIColor.quaternaryLabel)

    static let systemBackground = Color(UIColor.systemBackground)
    static let secondarySystemBackground = Color(UIColor.secondarySystemBackground)
    static let tertiarySystemBackground = Color(UIColor.tertiarySystemBackground)

    // There are more..
}


// 收起鍵盤
extension UIApplication {
    func endEditing() {
        
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

// 移除 NavigationBar button text
extension UINavigationController {
    
    open override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        navigationBar.topItem?.backButtonDisplayMode = .minimal
    }
}
