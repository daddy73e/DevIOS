//
//  ListItemView.swift
//  iOSSwiftUI
//
//  Created by Yeongeun Song on 2020/08/20.
//  Copyright © 2020 daddy73. All rights reserved.
//

import SwiftUI

struct ContentItemView: View {
    var item:TestItem
    var body: some View {
        HStack {
            Text("\(item.id)")
            Text(item.name).padding([.leading])
            Spacer()
        }.padding()
    }
}

struct ContentItemView_Previews: PreviewProvider {
    static var previews: some View {
        ContentItemView(item: DataManager().getDataList()[0])
    }
}
