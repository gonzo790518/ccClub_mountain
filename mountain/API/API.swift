//
//  API.swift
//  mountain
//
//  Created by gonzo_li on 2022/11/28.
//

import SwiftUI
import Alamofire
import ProgressHUD

enum Sex: String {
    case M
    case F
}

struct API {
    static let shared = API()
    let domain = "http://192.168.50.118:8080"
    let headers: HTTPHeaders = [
        "Content-Type": "application/json"
    ]
    
    func getMountains() {
        
        let url = domain + "/mountains"
        AF.request(url, headers: headers).responseDecodable(of: [Mountain].self) { response in
            
            ProgressHUD.dismiss()
            switch response.result {
            case .success(let data):
                //response.result.success
                print(data)
            case .failure(let error):
                print("Error:", error)
            }
        }
    }
    
    func postRandom(sex: Sex, age: Int, heartRate: Int, height: Int, weight: Int) {

        let url = domain + "/random"
        let parameters = [
            "sex": sex.rawValue,
            "age": age,
            "heartRate": heartRate,
            "height": height,
            "weight": weight
        ] as [String : Any]
        AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseDecodable(of: [Mountain].self) { response in

            ProgressHUD.dismiss()
            switch response.result {
            case .success(let data):
                
                print(data)
            case .failure(let error):
                print("Error:", error)
            }
        }
    }

    func postRecommandMountains(sex: Sex, age: Int, heartRate: Int, height: Int, weight: Int, completion: @escaping ([Mountain]?) -> Void) {
        
        let url = domain + "/recommendations"
        let parameters = [
            "sex": sex.rawValue,
            "age": age,
            "heartRate": heartRate,
            "height": height,
            "weight": weight
        ] as [String : Any]
        print("URL: \(url)")
        
        AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseDecodable(of: [Mountain].self) { response in
            
            ProgressHUD.dismiss()
            switch response.result {
            case .success(let data):
                
                completion(data)
            case .failure(let error):
                
                print("[POST] Recommandation Error: \(error)")
                completion(nil)
            }
        }
    }
}

    
