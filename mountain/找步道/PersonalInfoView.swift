//
//  PersonalInfoView.swift
//  mountain
//
//  Created by gonzo_li on 2022/12/4.
//

import SwiftUI
import ProgressHUD

struct PersonalInfoView: View {
    @StateObject var viewModel = PersonalInfoViewModel()
    @State private var isMale = true
    @State private var isFemale = false
    @State private var age = ""
    @State private var heartRate = ""
    @State private var height = ""
    @State private var weight = ""
    @State private var hasSport = false
    @State private var noSport = true
    
    let screenWidth = UIScreen.main.bounds.width
    
    init() {
        UINavigationBar.appearance().titleTextAttributes = [
            .foregroundColor: UIColor.darkGray,
            .font : UIFont(name: "Georgia-Bold", size: 20)!
        ]
        UINavigationBar.appearance().backgroundColor = .white
    }
    
    var body: some View {
        VStack {
            Text("請輸入您的資料")
                .font(.custom("PingFangTC-Medium", size: 24))
                .foregroundColor(.darkGray)
                .padding(.top, -20)
                .padding(.horizontal)
                .padding(.bottom, 5)
            Text("讓我們幫您找出適合的步道吧！")
                .font(.custom("PingFangTC-Light", size: 18))
                .foregroundColor(.darkGray)
            
            // 性別
            HStack {
                Image("icons-gender-64")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30)
                Text("性別：")
                    .font(.custom("PingFangTC-Regular", size: 18))
                    .foregroundColor(.darkGray)
                Toggle("Male", isOn: $isMale)
                    .toggleStyle(.button)
                    .tint(.mint)
                    .onChange(of: isMale) { value in
                        isFemale = !value
                    }
                Toggle("Female", isOn: $isFemale)
                    .toggleStyle(.button)
                    .tint(.mint)
                    .onChange(of: isFemale) { value in
                        isMale = !value
                    }
                Spacer()
            }
            .padding(.top, 20)
            .frame(maxWidth: screenWidth * 0.8)
            
            // 年齡
            HStack {
                Image("icons-birthday-50")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30)
                Text("年齡：")
                    .font(.custom("PingFangTC-Regular", size: 18))
                    .foregroundColor(.darkGray)
                TextField("", text: $age, prompt: Text("您的年齡"))
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.numberPad)
                Spacer()
            }
            .padding(.top)
            .frame(maxWidth: screenWidth * 0.8)
            
            // 心率
            HStack {
                Image("icons-heart-64")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30)
                Text("心率：")
                    .font(.custom("PingFangTC-Regular", size: 18))
                    .foregroundColor(.darkGray)
                TextField("", text: $heartRate, prompt: Text("您的心率，不知道請輸入0"))
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.numberPad)
                Spacer()
            }
            .padding(.top)
            .frame(maxWidth: screenWidth * 0.8)
            
            // 身高
            HStack {
                Image("icons-height-64")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30)
                Text("身高：")
                    .font(.custom("PingFangTC-Regular", size: 18))
                    .foregroundColor(.darkGray)
                TextField("", text: $height, prompt: Text("您的身高"))
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.numberPad)
                Spacer()
            }
            .padding(.top)
            .frame(maxWidth: screenWidth * 0.8)
            
            // 體重
            HStack {
                Image("icons-weight-64")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30)
                Text("體重：")
                    .font(.custom("PingFangTC-Regular", size: 18))
                    .foregroundColor(.darkGray)
                TextField("", text: $weight, prompt: Text("您的體重"))
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.numberPad)
                Spacer()
            }
            .padding(.top)
            .frame(maxWidth: screenWidth * 0.8)
            
            // 運動習慣
            HStack {
                Image("icons-running-50")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30)
                Text("是否有運動習慣：")
                    .font(.custom("PingFangTC-Regular", size: 18))
                    .foregroundColor(.darkGray)
                
                Toggle("Yes", isOn: $hasSport)
                    .toggleStyle(.button)
                    .tint(.mint)
                    .onChange(of: hasSport) { value in
                        noSport = !value
                    }
                Toggle("No", isOn: $noSport)
                    .toggleStyle(.button)
                    .tint(.mint)
                    .onChange(of: noSport) { value in
                        hasSport = !value
                    }
                Spacer()
            }
            .padding(.top)
            .frame(maxWidth: screenWidth * 0.8)
            
            HStack {
                /*
                Button {
                    
                    UIApplication.shared.endEditing()
                    viewModel.isRandomSuccess = true
                } label: {
                    
                    Text("隨機推薦")
                        .frame(width: screenWidth / 3, height: 25)
                        .font(.headline)
                        .padding(10)
                        .background(Color.darkGray)
                        .cornerRadius(.infinity)
                        .foregroundColor(.white)
                        .padding(5)
                }*/
                
                Button {
                    
                    UIApplication.shared.endEditing()
                    viewModel.isRecommendSuccess = false
                    viewModel.showNoDataAlert = false
                    viewModel.getRecommandMountains(sex: isMale ? .M: .F, age: Int(age) ?? 0, heartRate: Int(heartRate) ?? 0, height: Int(height) ?? 0, weight: Int(weight) ?? 0, sport: hasSport)
//                    viewModel.getRecommandMountains(sex: isMale ? .M: .F, age: 20, heartRate: 20, height: 20, weight: 20, sport: hasSport)
                } label: {
                    
                    Text("找步道")
                        .frame(width: screenWidth * 0.6, height: 25)
                        .font(.headline)
                        .padding(10)
                        .background(Color.darkGray)
                        .cornerRadius(.infinity)
                        .foregroundColor(.white)
                        .padding(5)
                        .padding(.top, -30)
                }
            }
            .padding(.top, 60)
        }
        .navigationTitle("基本資料")
        .navigationDestination(isPresented: $viewModel.isRecommendSuccess) {
            RecommandView(mountainList: $viewModel.mountainList)
        }
        .navigationDestination(isPresented: $viewModel.isRandomSuccess) {
            RandomView()
        }
        .alert(isPresented: $viewModel.showNoDataAlert) {
            Alert(
                title: Text("Oh..很抱歉"), message: Text("目前沒有適合你的步道，多去公園走走提升體力吧！")
            )
        }
    }
}

struct PersonalInfoView_Previews: PreviewProvider {
    static var previews: some View {
        PersonalInfoView()
    }
}
