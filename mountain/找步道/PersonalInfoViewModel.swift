//
//  PersonalInfoViewModel.swift
//  mountain
//
//  Created by gonzo_li on 2022/12/5.
//

import Foundation
import ProgressHUD

class PersonalInfoViewModel: ObservableObject {
    @Published var mountainList = [Mountain]()
    @Published var isRandomSuccess = false
    @Published var isRecommendSuccess = false
    
    func getRecommandMountains(sex: Sex, age: Int, heartRate: Int, height: Int, weight: Int, sport: Bool) {
        
        if age == 0 || height == 0 || weight == 0 {
            // Alert 請輸入您的資料
            return
        }
        
        ProgressHUD.show()
        API.shared.postRecommandMountains(sex: sex, age: age, heartRate: heartRate, height: height, weight: weight, sportHobit: sport, completion: { result in
            
            if result != nil {
                
                self.mountainList = result ?? []
                self.isRecommendSuccess = true
            }
        })
    }
}
