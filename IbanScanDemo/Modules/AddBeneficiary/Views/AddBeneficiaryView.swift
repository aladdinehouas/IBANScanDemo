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
                    .font(.headline)
                    .padding(.top)

                Text("Scannez, importez ou saisissez l’IBAN")
                    .font(.subheadline)
                    .foregroundColor(.gray)

                HStack(spacing: 16) {
                    NavigationLink(destination: ScanIBANView(viewModel: ScanIBANViewModel(coordinator: coordinator)),
                                   isActive: $coordinator.isShowingScanner) {
                        Button(action: {
                            viewModel.startScanning()
                        }) {
                            HStack {
                                Image(systemName: "camera.fill")
                                Text("Scanner")
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 8)
                                            .stroke(Color.teal, lineWidth: 1))
                        }
                    }

                    Button(action: {
                    }) {
                        HStack {
                            Image(systemName: "square.and.arrow.down.fill")
                            Text("Importer")
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 8)
                                        .stroke(Color.teal, lineWidth: 1))
                    }
                }
                .padding(.horizontal)

                TextField("FR76 XXXX", text: $coordinator.ibanText)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 8).fill(Color(UIColor.systemGray6)))
                    .padding(.horizontal)
            }
            .padding()
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
