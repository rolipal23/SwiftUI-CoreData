//
//  MapView.swift
//  Landmarks
//
//  Created by Roli Pal on 21/07/23.
//

import SwiftUI
import MapKit

struct MapView: View {
	var coordinates: CLLocationCoordinate2D
	
	@State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: -36.867653, longitude: 174.778011), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
	
    var body: some View {
        Map(coordinateRegion: $region)
			.onAppear {
				setRegion(coordinates)
			}
    }
	
	private func setRegion(_ coordinate: CLLocationCoordinate2D) {
		region = MKCoordinateRegion(
			center: coordinate,
			span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
		)
	}
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinates: CLLocationCoordinate2D(latitude: -36.867653, longitude: 174.778011))
    }
}

