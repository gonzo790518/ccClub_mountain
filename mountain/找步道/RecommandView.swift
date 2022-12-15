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
    @State private var selectedItem: Mountain = Mountain(步道名稱: "", 所在地區: "", 單趟里程: 0.0, 海拔高度: 0, 高度落差: "", 所需時間: "", 難易度: 0, 申請入山: false, 路面狀況: "", 經緯度: [], 路線網址: "", 圖片: [], 位置: "", 體能等級: "")
    @State private var isPopoverPresented = false
    @State var popoverSize = CGSize(width: UIScreen.main.bounds.width/3, height: UIScreen.main.bounds.width)
    @State private var cityIndex = 0
    
    let screenWidth = UIScreen.main.bounds.width
    let userLevel: [Int: String] = [
        0: "太糟了⋯",
        1: "不太好捏⋯",
        2: "嗯～一般般",
        3: "不錯唷～",
        4: "很棒哦！",
        5: "灰熊厲害！"
    ]
    
    let citys = [
        "所有縣市",
        "基隆市", "台北市", "新北市", "桃園市", "新竹縣", "新竹市",
        "苗栗縣", "台中市", "南投縣", "彰化縣", "雲林縣", "嘉義市",
        "嘉義縣", "台南市", "高雄市", "屏東縣", "宜蘭縣", "花蓮縣",
        "台東縣", "澎湖縣", "金門縣", "連江縣"
    ]

    let citysNumDict: [Int: String] = [
        1: "A", 2: "B", 3: "C", 4: "D", 5: "E", 6: "E",
        7: "F", 8: "G", 9: "H", 10: "I", 11: "J", 12: "K",
        13: "K", 14: "L", 15: "M", 16: "N", 17: "O", 18: "P",
        19: "Q", 20: "R", 21: "S", 22: "T"
    ]
    
    var body: some View {
        
        if mountainList.isEmpty {
            // .. 顯示無資料畫面
            Text("Oh.. 您的條件我們無法推薦步道給您 :(")
                .font(.headline)
        }
        
        ZStack {
            
            Text("無任何資料，請重新篩選")
                .foregroundColor(Color.darkGray)
                .opacity(mountainList.filter({ cityIndex == 0 ? true: $0.位置 == citysNumDict[cityIndex] }).isEmpty ? 1: 0)
                 .zIndex(1)
            
            VStack(alignment: .leading) {
                HStack {
                    
                    Text("您的體能等級： ")
                        .font(.subheadline)
                    Text(mountainList[0].體能等級)
                        .foregroundColor(Color.red)
                        .font(.headline)
                }
                .padding(.vertical)
                .padding(.leading, 15)
                
                Text("推薦以下步道給您：")
                    .font(.subheadline)
                    .padding(.leading, 15)
                    .padding(.top, -10)
                
                List {
                    ForEach(mountainList.filter({ cityIndex == 0 ? true: $0.位置 == citysNumDict[cityIndex] }), id: \.self) { item in
                        
                        HStack {
                            AsyncImage(url: URL(string: item.圖片.first ?? "")) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(maxWidth: 80, maxHeight: 80)
                                    .clipped()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(maxWidth: 80, maxHeight: 80)
                            
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
                                    Text("\(item.單趟里程)")
                                        .fontWeight(.light)
                                        .font(.caption)
                                        .foregroundColor(.darkGray)
                                }
                            }
                        }
                        .listRowSeparator(.hidden)
                        .contentShape(Rectangle())
                        .onTapGesture {
                            
                            print(item.圖片.last ?? "")
                            selectedItem = item
                            isGoingDetail = true
                        }
                    }
                }
                .listStyle(.plain)
            }
            .toolbar {
                WithPopover (
                    
                    showPopover: $isPopoverPresented,
                    popoverSize: popoverSize,
                    content: {
                        Button {
                            
                            isPopoverPresented.toggle()
                        } label: {
                            
                            Image("icons-filter-64")
                                .resizable()
                                .frame(width: 28, height: 28)
                        }
                    },
                    popoverContent: {
                        
                        List {
                            ForEach(Array(citys.enumerated()), id: \.element) { index, city in
                                Text(city)
                                    .font(.caption)
                                    .frame(width: popoverSize.width, height: 30)
                                    .background(Color.white)
                                    .onTapGesture {
                                        print(index)
                                        print(city)
                                        print(citysNumDict[index] ?? "NaN")
                                        cityIndex = index
                                        isPopoverPresented = false
                                    }
                            }
                            .listRowSeparator(.hidden)
                        }
                        .listStyle(PlainListStyle())
                    })
            }
        }
        .navigationTitle("推薦步道")
        .navigationDestination(isPresented: $isGoingDetail) {
            DetailView(mountain: selectedItem)
        }
    }
}
