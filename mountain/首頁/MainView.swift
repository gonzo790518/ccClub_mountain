//
//  MainView.swift
//  mountain
//
//  Created by gonzo_li on 2022/11/28.
//

import SwiftUI
import ProgressHUD

struct MainView: View {
    let screenWidth = UIScreen.main.bounds.width
    
    init() {
        ProgressHUD.animationType = .circleStrokeSpin
    }
    
    var body: some View {
        NavigationStack {
            
            Text("你能走什麼？")
                .fontWeight(.bold)
                .font(.custom("PingFangTC-Medium", fixedSize: 36))
                .foregroundColor(.darkGray)
                .padding()
            
            Image("app-icon")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.horizontal, 50)
            
            Text("此專案的動機為，專案發起人的父母，本身就只是健行族，因為不是登山客，也非對登山有興趣，只是想出外有個步道可以走走，所以他們並不會特意去做功課、查資料，當然也不可能會去健身房測試自身體能程度，也因為這樣有幾次聽他們走完的心得是「體力透支」、「其實那個步道不適合我們走」等，偶然有一次遇到了危險的情況，健行筆記內難易度低中的仙山，因攻頂前幾公尺的攀繩處，因為踩空，差點摔下岩壁，好在手還抓著繩子，若連繩子都未抓好，就摔下去重傷，甚至可能失去性命，故有了此專案的發想。")
                .font(.custom("PingFangTC-Regular", size: 16))
                .lineLimit(nil)
                .padding(.horizontal, 50)
            
            HStack {
                NavigationLink {
                    RandomView()
                } label: {
                    Text("搖一搖")
                        .frame(width: screenWidth / 3.5, height: 25)
                        .font(.headline)
                        .padding(10)
                        .background(Color.darkGray)
                        .cornerRadius(15)
                        .foregroundColor(.white)
                }
                NavigationLink {
                    PersonalInfoView()
                } label: {
                    Text("找步道")
                        .frame(width: screenWidth / 3.5, height: 25)
                        .font(.headline)
                        .padding(10)
                        .background(Color.darkGray)
                        .cornerRadius(15)
                        .foregroundColor(.white)
                }
            }
            .padding(.vertical, 30)
            Spacer()
        }
        .accentColor(.darkGray)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
