//
//  LandmarkList.swift
//  GreetMe
//
//  Created by Jacob on 1/22/22.
//

import SwiftUI

struct LandmarkList: View {
    @State private var onlyFavorites = false
    
    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $onlyFavorites) {
                    Text("Display Favorites")
                }
                ForEach(landmarks) { landmark in
                    if (landmark.isFavorite || !onlyFavorites) {
                        NavigationLink {
                            LandmarkDetail(landmark: landmark)
                        } label: {
                            LandmarkRow(landmark: landmark)
                        }
                    }
                }
            }
            .navigationTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
//        let devices = [
//            "iPhone SE (2nd generation)",
//            "iPhone XS Max",
//            "iPhone 12 Pro Max"
//        ]
//
//        ForEach(devices, id: \.self) { deviceName in
//            LandmarkList()
//                .previewDevice(PreviewDevice(rawValue: deviceName))
//                .previewDisplayName(deviceName)
//        }
    }
}
