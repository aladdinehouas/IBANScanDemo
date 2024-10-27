//
//  AppCoordinator.swift
//  IbanScanDemo
//
//  Created by Aladdin Houas on 27/10/2024.
//

import SwiftUI
import Combine

class AppCoordinator: ObservableObject {
    @Published var isShowingScanner = false
    @Published var ibanText: String = ""

    func start() -> some View {
        AddBeneficiaryView(viewModel: AddBeneficiaryViewModel(coordinator: self))
    }

    func showScanIBAN() {
        isShowingScanner = true
    }
}
