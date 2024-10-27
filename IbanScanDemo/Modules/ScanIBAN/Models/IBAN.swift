//
//  IBAN.swift
//  IbanScanDemo
//
//  Created by Aladdin Houas on 27/10/2024.
//

import Foundation

struct IBAN {
    var ibanValue: String

    func isValidFrenchIBAN() -> Bool {
        return ibanValue.hasPrefix("FR") && ibanValue.count == 27
    }
}
