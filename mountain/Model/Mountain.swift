//
//  Mountain.swift
//  mountain
//
//  Created by gonzo_li on 2022/11/28.
//

struct Mountain: Decodable {
    var 步道名稱: String
    var 所在地區: String
    var 里程: String
    var 海拔高度: Int
    var 高度落差: String
    var 所需時間: String
    var 難易度: Int
    var 申請入山: Bool
    var 路面狀況: String
    var 備註: String?
    var factor: Float?
    var VO2_need: Float?
    var VO2max: Double?
}
