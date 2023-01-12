//
//  DetailView.swift
//  mountain
//
//  Created by gonzo_li on 2022/12/6.
//

import SwiftUI

struct DetailView: View {
    @StateObject var viewModel = DetailViewModel()
    var mountain: Mountain = Mountain(步道名稱: "", 所在地區: "", 單趟里程: 0.0, 海拔高度: 0, 高度落差: "", 往返所需時間: "", 難易度: 0, 申請入山: false, 路面狀況: "", 經緯度: [], 路線網址: "", 圖片: [], 位置: "", 體能等級: "")
    let screenWidth = UIScreen.main.bounds.width
    var gridItemLayout = [GridItem(.fixed(80)), GridItem(.fixed(80)), GridItem(.fixed(80)), GridItem(.fixed(80))]
    @State private var imageHidden = true

    var body: some View {
        
        VStack {
            TabView {
                ForEach(Array(mountain.圖片.enumerated()), id: \.element) { index, url in
                    ZStack {
                        AsyncImage(url: URL(string: url)) { image in
                            
                            image.resizable()
                                .aspectRatio(contentMode: .fit)
                        } placeholder: {
                            ProgressView()
                        }
                        
                        VStack {
                            Spacer()
                            HStack {
                                Spacer()
                                ZStack {
                                    RoundedRectangle(cornerRadius: 15)
                                        .fill(Color(UIColor.lightGray))
                                        .frame(width: 50, height: 25)
                                        .opacity(0.6)
                                    
                                    Text("\(index + 1) / \(mountain.圖片.count)")
                                        .font(.subheadline)
                                        .foregroundColor(Color.systemBackground)
                                        .padding()
                                }
                            }.padding(.trailing, 10)
                        }
                    }
                }
            }
            .frame(width: screenWidth, height: screenWidth / 1.5)
            .tabViewStyle(.page(indexDisplayMode: .never))
            .opacity(imageHidden ? 0 : 1)
            
            
            ScrollView {
                HStack(alignment: .bottom) {
                    Text(mountain.步道名稱)
                        .fontWeight(.bold)
                        .font(.title2)
                        .foregroundColor(.darkGray)
                        .padding([.horizontal, .top])
                    Spacer()
                    ForEach(0 ..< mountain.難易度, id: \.self) { _ in
                        Image("icons-star-64")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .padding(.top)
                    }
                }.padding(.trailing, 20)
                
                HStack {
                    Text("單趟里程：")
                        .font(.headline)
                        .foregroundColor(.darkGray)
                        .padding(.horizontal)
                        .padding(.top, 10)
                    Text(String(mountain.單趟里程) + "公里")
                        .font(.subheadline)
                        .foregroundColor(.darkGray)
                        .padding(.top, 10)
                        .padding(.leading, -10)
                    Spacer()
                }
                
                HStack {
                    Text("海拔高度：")
                        .font(.headline)
                        .foregroundColor(.darkGray)
                        .padding(.horizontal)
                        .padding(.top, 10)
                    Text(String(mountain.海拔高度) + "公尺")
                        .font(.subheadline)
                        .foregroundColor(.darkGray)
                        .padding(.top, 10)
                        .padding(.leading, -10)
                    Spacer()
                }
                
                HStack {
                    Text("高度落差：")
                        .font(.headline)
                        .foregroundColor(.darkGray)
                        .padding(.horizontal)
                        .padding(.top, 10)
                    Text(String(mountain.高度落差))
                        .font(.subheadline)
                        .foregroundColor(.darkGray)
                        .padding(.top, 10)
                        .padding(.leading, -10)
                    Spacer()
                }
                
                HStack {
                    Text("往返時間：")
                        .font(.headline)
                        .foregroundColor(.darkGray)
                        .padding(.horizontal)
                        .padding(.top, 10)
                    Text(String(mountain.往返所需時間))
                        .font(.subheadline)
                        .foregroundColor(.darkGray)
                        .padding(.top, 10)
                        .padding(.leading, -10)
                    Spacer()
                }
                
                HStack {
                    Text("申請入山：")
                        .font(.headline)
                        .foregroundColor(.darkGray)
                        .padding(.horizontal)
                        .padding(.top, 10)
                    Text("\(mountain.申請入山 ? "是": "否")")
                        .font(.subheadline)
                        .foregroundColor(.darkGray)
                        .padding(.top, 10)
                        .padding(.leading, -10)
                    Spacer()
                }
                
                HStack(spacing: 0) {
                    Text("路面狀況：")
                        .font(.headline)
                        .foregroundColor(.darkGray)
                        .padding(.horizontal)
                        .padding(.top, 10)
                    Text(String(mountain.路面狀況))
                        .font(.subheadline)
                        .foregroundColor(.darkGray)
                        .padding(.top, 10)
                        .padding(.leading, -10)
                    Spacer()
                }
                
                //攀岩、 陡上、 拉繩、 下切、 攀爬
                if let danger = mountain.備註, danger.count > 0 {
                    
                    HStack(alignment: .bottom) {
                        Text("備註：")
                            .font(.headline)
                            .foregroundColor(.darkGray)
                            .padding(.leading)
                            .padding(.top, 10)
                        Spacer()
                    }
                    HStack {
                        ScrollView {
                            LazyVGrid(columns: gridItemLayout, alignment: .leading, spacing: 10) {
                                ForEach(viewModel.dangerFactory(danger: danger), id: \.self) { item in
                                    Button {
                                        // ..
                                    } label: {
                                        
                                        Image("icons-warning-96")
                                            .resizable()
                                            .frame(width: 20, height: 20)
                                        Text(item)
                                            .font(.subheadline)
                                            .foregroundColor(.darkGray)
                                            .padding(.leading, -5)
                                    }
                                    .padding(8)
                                    .background(Color.secondarySystemBackground)
                                    .cornerRadius(20)
                                }
                            }
                            .padding(.horizontal, 15)
                        }
                        .scrollDisabled(true)
                    }
                }
                
                
                // 路線網址
                
                HStack(alignment: .center) {
                    if let url = URL(string: mountain.路線網址 ?? "") {
                        Link(destination: url) {
                            Text("路線參考")
                                .frame(height: 25)
                                .font(.headline)
                                .padding(.horizontal, 15)
                                .padding(.vertical, 10)
                                .background(Color.darkGray)
                                .cornerRadius(.infinity)
                                .foregroundColor(.white)
                        }
                    }
                    
                    if let lat = mountain.經緯度?.first, let lng = mountain.經緯度?.last {
                        
                        Button {
                            
                            viewModel.openGoogleMap(lat: lat, lng: lng)
                        } label: {
                            
                            Text("馬上出發")
                                .frame(height: 25) // width: screenWidth / 3.5,
                                .font(.headline)
                                .padding(.horizontal, 15)
                                .padding(.vertical, 10)
                                .background(Color.darkGray)
                                .cornerRadius(.infinity)
                                .foregroundColor(.white)
                        }
                    }

                    Spacer()
                }
                .padding(.leading, 15)
                .padding(.top, 15)
            }
        }
        .onAppear {
            // Let image display delay because ui issue.
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                
                withAnimation(.easeInOut(duration: 0.1)) {
                    self.imageHidden = false
                }
            }
        }
    }
}
