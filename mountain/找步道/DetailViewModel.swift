//
//  DetailViewModel.swift
//  mountain
//
//  Created by gonzo_li on 2022/12/6.
//

import Foundation

class DetailViewModel: ObservableObject {
    
    func dangerFactory(danger: String) -> [String] {
        
        let dangerList = danger.components(separatedBy: "、")
        return dangerList
    }
}
