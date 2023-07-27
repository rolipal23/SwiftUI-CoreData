//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Roli Pal on 24/07/23.
//

import SwiftUI

struct LandmarkList: View {
	@EnvironmentObject var modelData: ModelData
	@State private var showFavoritesOnly = false
	
	var filteredLandmarks: [Landmark] {
		modelData.landmarks.filter {
			landmark in (!showFavoritesOnly || landmark.isFavorite)
		}
	}
	
    var body: some View {
		NavigationView {
			List {
				Toggle("Favourites Only", isOn: $showFavoritesOnly)
				
				ForEach(filteredLandmarks) { landmark in
					NavigationLink {
						LandMarkDetail(landmark: landmark)
					} label: {
						LandmarkRow(landmark: landmark)
					}
				}
				.navigationTitle("New Zealand")
			}
		}
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
			.environmentObject(ModelData())
    }
}
