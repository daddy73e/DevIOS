//
//  ContentView.swift
//  iOSSwiftUI
//
//  Created by Yeongeun Song on 2020/08/06.
//  Copyright © 2020 daddy73. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            MapView().frame(height: 300)
            
            CircleImage()
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                Text("Hello, World!")
                    .font(.largeTitle)
                HStack {
                    Text("TEST").font(.subheadline)
                    Spacer()
                    Text("Califonia")
                        .font(.subheadline)
                }
            }.padding()
            
            Spacer()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
