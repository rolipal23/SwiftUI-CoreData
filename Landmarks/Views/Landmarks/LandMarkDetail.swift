//
//  LandMarkDetail.swift
//  Landmarks
//
//  Created by Roli Pal on 24/07/23.
//

import SwiftUI

struct LandMarkDetail: View {
	
	@EnvironmentObject var modelData: ModelData
	var landmark: Landmark
	
	var landmarkIndex: Int {
		modelData.landmarks.firstIndex(where:{
			$0.id == landmark.id
		})!
	}
	
    var body: some View {
		ScrollView {
			MapView(coordinates: landmark.locationCoordinate)
				.ignoresSafeArea(edges: .top)
				.frame(height:300)
			
			CircleImage(image: landmark.image)
				.offset(y: -130)
				.padding(.bottom, -130)
			
			VStack(alignment: .leading) {
				HStack {
					Text(landmark.name)
							.font(.title)
					FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
				}

				Text(landmark.name)
					.font(.title)
				HStack {
					Text(landmark.park)
					Spacer()
					Text(landmark.state)
				}
				.font(.subheadline)
				.foregroundColor(.secondary)
				
				Divider()
				Text("About \(landmark.name)")
					.font(.title2)
				Text(landmark.description)

			}
			.padding()
			Spacer()
		}
		.navigationTitle(landmark.name)
		.navigationBarTitleDisplayMode(.inline)
    }
}

struct LandMarkDetail_Previews: PreviewProvider {
	static let modelData = ModelData()
    static var previews: some View {
		LandMarkDetail(landmark: ModelData().landmarks[1])
			.environmentObject(modelData)
    }
}
