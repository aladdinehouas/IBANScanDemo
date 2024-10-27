//
//  AddBeneficiaryViewModel.swift
//  IbanScanDemo
//
//  Created by Aladdin Houas on 27/10/2024.
//

import SwiftUI

class AddBeneficiaryViewModel: ObservableObject {
    var coordinator: AppCoordinator

    init(coordinator: AppCoordinator) {
        self.coordinator = coordinator
    }

    func startScanning() {
        coordinator.showScanIBAN()
    }
}

