//
//  ImageListView.swift
//  iOSSwiftUI
//
//  Created by Yeongeun Song on 2020/08/21.
//  Copyright © 2020 daddy73. All rights reserved.
//

import SwiftUI
import Alamofire

struct ImageListView: View {
    var imageDatas = DataManager().getImageDataList()
    var body: some View {
        List(imageDatas) { data in
            ImageItemView(item: data)
        }
        .navigationBarTitle(Text("Car Seat"), displayMode: .inline)
        
    }
}

struct ImageListView_Previews: PreviewProvider {
    static var previews: some View {
        ImageListView()
    }
}
