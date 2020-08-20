//
//  ContentView.swift
//  iOSSwiftUI
//
//  Created by Yeongeun Song on 2020/08/20.
//  Copyright © 2020 daddy73. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var datas = DataManager().getDataList()
    var body: some View {
        NavigationView {
            List(datas) { data in
                NavigationLink(destination: TestView(item: data)) {
                    ContentItemView(item:data)
                }
                
            }
            .navigationBarTitle(Text("SwiftUI Example"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
