//
//  LandmarkList.swift
//  GreetMe
//
//  Created by Jacob on 1/22/22.
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var onlyFavorites = false
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!onlyFavorites || landmark.isFavorite)
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $onlyFavorites) {
                    Text("Display Favorites")
                }
                
                ForEach(filteredLandmarks) { landmark in
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
            .environmentObject(ModelData())
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
