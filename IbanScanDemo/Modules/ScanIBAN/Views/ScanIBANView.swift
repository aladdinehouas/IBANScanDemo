//
//  ScanIBANView.swift
//  IbanScanDemo
//
//  Created by Aladdin Houas on 27/10/2024.
//

import SwiftUI
import AVFoundation

struct ScanIBANView: View {
    @ObservedObject var viewModel: ScanIBANViewModel
    @State private var detectedIBAN = ""

    var body: some View {
        VStack {
            Text("Scanner l'IBAN")
                .font(.title)
            
            CameraView(detectedText: $detectedIBAN)
                .frame(width: 300, height: 100)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.blue, lineWidth: 3)
                )

            Text("IBAN détecté: \(detectedIBAN)")
                .padding()

            Button("Valider") {
                viewModel.validateIBAN(scannedText: detectedIBAN)
            }
            .disabled(detectedIBAN.isEmpty)

            Button("Recommencer") {
                detectedIBAN = ""
                viewModel.resetScanner()
            }
        }
    }
}
