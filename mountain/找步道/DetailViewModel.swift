//
//  DetailViewModel.swift
//  mountain
//
//  Created by gonzo_li on 2022/12/6.
//

import Foundation
import UIKit

class DetailViewModel: ObservableObject {
    
    func dangerFactory(danger: String) -> [String] {
        
        let dangerList = danger.components(separatedBy: "、")
        return dangerList
    }
    
    func openGoogleMap(lat: String, lng: String) {
        let latDouble =  Double(lat)!
        let longDouble =  Double(lng)!
        print(latDouble)
        print(longDouble)
        if (UIApplication.shared.canOpenURL(URL(string:"comgooglemaps://")!)) {  //if phone has an app
            
            if let url = URL(string: "comgooglemaps-x-callback://?saddr=&daddr=\(latDouble),\(longDouble)&directionsmode=driving") {
                UIApplication.shared.open(url, options: [:])
            }}
        else {
            
            //Open in browser
            if let urlDestination = URL.init(string: "https://www.google.co.in/maps/dir/?saddr=&daddr=\(latDouble),\(longDouble)&directionsmode=driving") {
                UIApplication.shared.open(urlDestination)
            }
        }
    }
}
