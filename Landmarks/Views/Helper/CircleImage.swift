//
//  CircleImage.swift
//  Landmarks
//
//  Created by Roli Pal on 21/07/23.
//

import SwiftUI

struct CircleImage: View {
	var image: Image
	
    var body: some View {
		image
			.clipShape(Circle())
			.overlay {
				Circle().stroke(.white, lineWidth: 6)
			}
			.shadow(radius: 7)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
		CircleImage(image: Image("NewZealand"))
    }
}
