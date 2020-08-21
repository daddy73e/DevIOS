//
//  ContentDetailView.swift
//  iOSSwiftUI
//
//  Created by Yeongeun Song on 2020/08/20.
//  Copyright © 2020 daddy73. All rights reserved.
//

import SwiftUI

struct ContentDetailView: View {
    var item:TestItem
    var body: some View {
        switch item.id {
        case 0:
            return AnyView(ImageListView())
        default:
            return AnyView(TestView())
        }
    }
}

struct ContentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentDetailView(item:DataManager().getMainDataList()[0])
    }
}
