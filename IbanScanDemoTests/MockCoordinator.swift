//
//  MockCoordinator.swift
//  IbanScanDemoTests
//
//  Created by Aladdin Houas on 28/10/2024.
//

import XCTest
@testable import IbanScanDemo

class MockCoordinator: AppCoordinator {
    var ibanTextMock: String = ""
    var isShowingScannerMock: Bool = false

    override var ibanText: String {
        get { ibanTextMock }
        set { ibanTextMock = newValue }
    }

    override var isShowingScanner: Bool {
        get { isShowingScannerMock }
        set { isShowingScannerMock = newValue }
    }
}
