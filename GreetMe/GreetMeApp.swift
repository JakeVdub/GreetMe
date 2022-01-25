//
//  GreetMeApp.swift
//  GreetMe
//
//  Created by Jacob on 1/20/22.
//

import SwiftUI

@main
struct GreetMeApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
