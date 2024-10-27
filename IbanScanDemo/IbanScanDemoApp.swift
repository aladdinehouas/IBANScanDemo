//
//  IbanScanDemoApp.swift
//  IbanScanDemo
//
//  Created by Aladdin Houas on 27/10/2024.
//

import SwiftUI

@main
struct IbanScanDemoApp: App {
    @StateObject private var coordinator = AppCoordinator()
    
    var body: some Scene {
        WindowGroup {
            coordinator.start()
                .environmentObject(coordinator)
        }
    }
}
