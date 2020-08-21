//
//  ImageItemView.swift
//  iOSSwiftUI
//
//  Created by Yeongeun Song on 2020/08/21.
//  Copyright © 2020 daddy73. All rights reserved.
//

import SwiftUI
import KingfisherSwiftUI

struct ImageItemView: View {
    var item:ImageItem
    var body: some View {
        HStack{
            Text(item.name)
            Spacer()
            KFImage(URL(string: item.path))
                .resizable()
                .frame(width: 80.0, height: 80.0)
        }.padding()
    
    }
}

struct ImageItemView_Previews: PreviewProvider {
    static var previews: some View {
        ImageItemView(item: DataManager().getImageDataList()[0])
    }
}
