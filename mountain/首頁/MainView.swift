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
            
            Image("app-icon")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.horizontal, 50)
                .padding(.top, 110)
            
            Text("出遊想找些步道走走\n卻又不知道你的體力是否能夠負荷嗎\n讓我們推薦\n你能走什麼")
                .font(.custom("PingFangTC-Medium", size: 20))
                .multilineTextAlignment(.center)
                .foregroundColor(.darkGray)
                .lineLimit(nil)
                .lineSpacing(5)
                .padding(.horizontal, 50)
            
            HStack {
                NavigationLink {
                    
                    PersonalInfoView()
                } label: {
                    
                    Text("開始使用")
                        .frame(width: screenWidth * 0.6, height: 25)
                        .font(.headline)
                        .padding(10)
                        .background(Color.darkGray)
                        .cornerRadius(.infinity)
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
