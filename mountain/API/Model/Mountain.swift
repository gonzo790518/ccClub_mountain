//
//  Mountain.swift
//  mountain
//
//  Created by gonzo_li on 2022/11/28.
//

struct Mountain: Decodable, Hashable {
    var 步道名稱: String
    var 所在地區: String
    var 單趟里程: Float // 里程 String
    var 海拔高度: Int
    var 高度落差: String
    var 往返所需時間: String
    var 難易度: Int
    var 申請入山: Bool
    var 路面狀況: String
    var 備註: String?
    var 經緯度: [String]?
    var 路線網址: String?
    var 圖片: [String]
    var 位置: String
    var 體能等級: String
    var VO2_need: Float?
    var VO2max: Double?
}
