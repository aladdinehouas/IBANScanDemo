//
//  AddBeneficiaryView.swift
//  IbanScanDemo
//
//  Created by Aladdin Houas on 27/10/2024.
//

import SwiftUI

struct AddBeneficiaryView: View {
    @ObservedObject var viewModel: AddBeneficiaryViewModel
    @EnvironmentObject var coordinator: AppCoordinator

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Ajouter un bénéficiaire")
                    .font(.title)

                Text("Scannez, importez ou saisissez l’IBAN")
                    .font(.subheadline)

                NavigationLink(destination: ScanIBANView(viewModel: ScanIBANViewModel(coordinator: coordinator)),
                               isActive: $coordinator.isShowingScanner) {
                    Button("Scanner") {
                        viewModel.startScanning()
                    }
                }

                TextField("FR76 XXXX", text: $coordinator.ibanText)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .padding()
        }
    }
}
