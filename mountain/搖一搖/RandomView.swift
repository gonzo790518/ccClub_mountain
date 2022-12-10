//
//  RandomView.swift
//  mountain
//
//  Created by gonzo_li on 2022/12/3.
//

import SwiftUI

struct RandomView: View {
    
    var body: some View {
//        Text("RandomView")
//        API.shared.postRandom(sex: Sex.M, age: 32, heartRate: 65, height: 187, weight: 78)

        Link(destination: URL(string: "https://earth.google.com/web/@24.171876,121.28544,3113.00833605a,3046.772489d,35y,36.04266495h,0t,0r/data=OgMKATA?authuser=0")!, label: {
            Text("KML")
                .foregroundColor(.blue)
        })
    }
}

struct RandomView_Previews: PreviewProvider {
    static var previews: some View {
        RandomView()
    }
}
