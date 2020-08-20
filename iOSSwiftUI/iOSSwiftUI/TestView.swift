//
//  TestView.swift
//  iOSSwiftUI
//
//  Created by Yeongeun Song on 2020/08/20.
//  Copyright © 2020 daddy73. All rights reserved.
//

import SwiftUI

struct TestView: View {
    var item:TestItem
    var body: some View {
        Text("\(item.id) :  \(item.name)")
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView(item:DataManager().getDataList()[0])
    }
}
