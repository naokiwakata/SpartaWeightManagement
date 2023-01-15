//
//  TopView.swift
//  SpartaWeightManagement
//
//  Created by 若田直希 on 2023/01/15.
//

import SwiftUI

struct TopView: View {
    var body: some View {
        TabView {
            InputView()
                .tabItem {
                    VStack {
                        Image(systemName: "person.fill")
                        Text("メイン")
                    }
                }.tag(1)
            GraphView()
                .tabItem {
                    VStack {
                        Image(systemName: "waveform.path.ecg")
                        Text("グラフ")
                    }
                }.tag(2)
        }
        
    }
}

struct TopView_Previews: PreviewProvider {
    static var previews: some View {
        TopView()
    }
}
