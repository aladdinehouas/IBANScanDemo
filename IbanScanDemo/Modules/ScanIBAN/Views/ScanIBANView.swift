//
//  ScanIBANView.swift
//  IbanScanDemo
//
//  Created by Aladdin Houas on 27/10/2024.
//

import SwiftUI

struct ScanIBANView: View {
    @ObservedObject var viewModel: ScanIBANViewModel
    @State private var isValidationSheetPresented = false
    @State private var detectedIBAN: String = ""

    var body: some View {
        ZStack {
            CameraView { iban in
                self.detectedIBAN = iban
                withAnimation {
                    self.isValidationSheetPresented = true
                }
            }
            .frame(width: 300, height: 100)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.blue, lineWidth: 3)
            )

            if isValidationSheetPresented {
                ValidationSheet(
                    iban: detectedIBAN,
                    onValidate: {
                        viewModel.validateIBAN(scannedText: detectedIBAN)
                        withAnimation {
                            isValidationSheetPresented = false
                        }
                    },
                    onRetry: {
                        withAnimation {
                            isValidationSheetPresented = false
                        }
                    }
                )
                .transition(.move(edge: .bottom))
                .zIndex(1)
            }
        }
        .ignoresSafeArea()
    }
}
