//
//  MapView.swift
//  iOSSwiftUI
//
//  Created by Yeongeun Song on 2020/08/18.
//  Copyright © 2020 daddy73. All rights reserved.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }
    
    func updateUIView(_ uiView: MKMapView,
                      context: Context) {
        let coordinate = CLLocationCoordinate2D(
            latitude: 37.556256, longitude: 126.972130)
        let span = MKCoordinateSpan(latitudeDelta: 2.0, longitudeDelta: 2.0)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        uiView.setRegion(region, animated: true)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
