//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Roli Pal on 10/05/23.
//

import SwiftUI

@main
struct LandmarksApp: App {
	@StateObject private var modelData = ModelData()
	
    var body: some Scene {
        WindowGroup {
            ContentView()
				.environmentObject(modelData)
        }
    }
}
