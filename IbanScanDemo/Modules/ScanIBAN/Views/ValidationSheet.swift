//
//  ValidationSheet.swift
//  IbanScanDemo
//
//  Created by Aladdin Houas on 28/10/2024.
//

import SwiftUI

struct ValidationSheet: View {
    let iban: String
    let onValidate: () -> Void
    let onRetry: () -> Void

    var body: some View {
        VStack(spacing: 16) {
            Spacer() // Pushes content to the bottom

            VStack(spacing: 16) {
                Text("L'IBAN du bénéficiaire a été scanné")
                    .font(.headline)
                    .padding(.top, 16)

                Text("Pensez à le vérifier avant de valider :")
                    .font(.subheadline)
                    .foregroundColor(.gray)

                Text(iban)
                    .font(.title3)
                    .foregroundColor(.white)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 8).fill(Color.teal.opacity(0.8)))
                    .padding(.horizontal)

                HStack(spacing: 20) {
                    Button(action: onValidate) {
                        Text("Valider")
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.teal)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }

                    Button(action: onRetry) {
                        Text("Recommencer")
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.clear)
                            .foregroundColor(.gray)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                    }
                }
                .padding(.horizontal)
                .padding(.bottom, 16)
            }
            .frame(maxWidth: .infinity)
            .background(Color.black.opacity(0.9))
            .cornerRadius(16)
            .shadow(radius: 20)
            .padding(.horizontal)
            .padding(.bottom, 30) // Adjust for safe area if needed
        }
        .background(Color.black.opacity(0.3).ignoresSafeArea())
    }
}
