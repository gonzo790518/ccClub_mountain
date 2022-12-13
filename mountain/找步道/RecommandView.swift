//
//  RecommandView.swift
//  mountain
//
//  Created by gonzo_li on 2022/12/3.
//

import SwiftUI

struct RecommandView: View {
    @Binding public var mountainList: [Mountain]
    @State private var isGoingDetail = false
    @State private var selectedItem: Mountain = Mountain(步道名稱: "", 所在地區: "", 里程: "", 海拔高度: 0, 高度落差: "", 所需時間: "", 難易度: 0, 申請入山: false, 路面狀況: "", 經緯度: [], 路線網址: "", 圖片網址: "")

    let screenWidth = UIScreen.main.bounds.width
    let userLevel: [Int: String] = [
        0: "太糟了⋯",
        1: "不太好捏⋯",
        2: "嗯～一般般",
        3: "不錯唷～",
        4: "很棒哦！",
        5: "灰熊厲害！"
    ]
    
    var body: some View {
        
        if mountainList.isEmpty {
            // .. 顯示無資料畫面
            Text("Oh.. 您的條件我們無法推薦步道給您 :(")
        }
        
        VStack(alignment: .leading) {
            HStack {
                
                Text("您的體能等級： ")
                    .font(.subheadline)
                Text("\(userLevel[0]!)")
                    .foregroundColor(Color.red)
                    .font(.headline)
            }
            .padding(.vertical)
            .padding(.leading, 15)
            
            Text("推薦以下步道給您：")
                .font(.subheadline)
                .padding(.leading, 15)
                .padding(.top, -10)
            
            List(mountainList, id: \.self) { item in
                
                HStack {
                    AsyncImage(url: URL(string: item.圖片網址)) { image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 80, height: 80)
                    
                    VStack {
                        HStack {
                            Text(item.步道名稱)
                                .font(.headline)
                                .foregroundColor(.darkGray)
                            Spacer()
                            if item.備註 != nil {
                                Image("icons-warning-96")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .padding(.top, 5)
                            }
                        }.padding(.vertical, 2)
                        HStack {
                            Text(item.所在地區)
                                .font(.subheadline)
                                .foregroundColor(.darkGray)
                            Spacer()
                        }.padding(.bottom, 1)
                        HStack {
                            Text(item.所需時間)
                                .fontWeight(.light)
                                .font(.subheadline)
                                .foregroundColor(.darkGray)
                            Spacer()
                            Text(item.里程)
                                .fontWeight(.light)
                                .font(.caption)
                                .foregroundColor(.darkGray)
                        }
                    }
                }
                .listRowSeparator(.hidden)
                .contentShape(Rectangle())
                .onTapGesture {
                    
                    selectedItem = item
                    isGoingDetail = true
                }
            }
            .listStyle(.plain)
        }
        .navigationTitle("推薦步道")
        .navigationDestination(isPresented: $isGoingDetail) {
            DetailView(mountain: selectedItem)
        }
    }
}
