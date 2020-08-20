//
//  CircleImage.swift
//  iOSSwiftUI
//
//  Created by Yeongeun Song on 2020/08/18.
//  Copyright © 2020 daddy73. All rights reserved.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        Image("ygsong").resizable()
        .scaledToFill()
        .frame(width: 300.0, height: 300.0)
        .clipShape(Circle())
        .overlay(Circle().stroke(Color.white, lineWidth: 4))
        .shadow(radius: 10)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
