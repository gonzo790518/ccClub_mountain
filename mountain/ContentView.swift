//
//  ContentView.swift
//  mountain
//
//  Created by gonzo_li on 2022/11/28.
//

import SwiftUI
import ProgressHUD

struct ContentView: View {
    
    init() {
        ProgressHUD.animationType = .circleStrokeSpin
    }
    
    var body: some View {
        VStack {
            Spacer()
            Button {
                
                API.shared.getMountains()
            } label: {
                Text("Get Mountains")
            }
            Spacer()
            Button {
                
                ProgressHUD.show()
                API.shared.postRecommandMountains(sex: Sex.M, age: 32, heartRate: 65, height: 187, weight: 78)
            } label: {
                Text("Get Recommandations")
            }
            Spacer()
            Button {
                
                ProgressHUD.show()
                API.shared.postRandom(sex: Sex.M, age: 32, heartRate: 65, height: 187, weight: 78)
            } label: {
                Text("Get Random")
            }
            Spacer()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
