//
//  MapAppApp.swift
//  MapApp
//
//  Created by zubair ahmed on 27/05/25.
//

import SwiftUI

@main
struct MapAppApp: App {
    @StateObject private var vm=LocationsViewModel()
    var body: some Scene {
        WindowGroup {
            LocationsView()
                .environmentObject(vm)
        }
    }
}
