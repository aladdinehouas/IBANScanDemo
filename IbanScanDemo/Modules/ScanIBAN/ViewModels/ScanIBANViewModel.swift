//
//  ScanIBANViewModel.swift
//  IbanScanDemo
//
//  Created by Aladdin Houas on 27/10/2024.
//

import Foundation
import Combine

class ScanIBANViewModel: ObservableObject {
    var coordinator: AppCoordinator

    init(coordinator: AppCoordinator) {
        self.coordinator = coordinator
    }

    func validateIBAN(scannedText: String) {
        coordinator.ibanText = scannedText
        coordinator.isShowingScanner = false
    }

    func resetScanner() {
        coordinator.isShowingScanner = false
        coordinator.ibanText = ""
    }
}
