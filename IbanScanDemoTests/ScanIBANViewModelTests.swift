//
//  ScanIBANViewModelTests.swift
//  IbanScanDemoTests
//
//  Created by Aladdin Houas on 28/10/2024.
//

import XCTest
@testable import IbanScanDemo

class ScanIBANViewModelTests: XCTestCase {

    var viewModel: ScanIBANViewModel!
    var mockCoordinator: MockCoordinator!

    override func setUp() {
        super.setUp()
        mockCoordinator = MockCoordinator()
        viewModel = ScanIBANViewModel(coordinator: mockCoordinator)
    }

    override func tearDown() {
        viewModel = nil
        mockCoordinator = nil
        super.tearDown()
    }

    func testValidateIBAN() {
        // Given
        let scannedIBAN = "FR7612548029981234567890131"
        
        // When
        viewModel.validateIBAN(scannedText: scannedIBAN)
        
        // Then
        XCTAssertEqual(mockCoordinator.ibanTextMock, scannedIBAN, "L'IBAN du coordinator devrait être mis à jour avec le texte scanné.")
        XCTAssertFalse(mockCoordinator.isShowingScannerMock, "Le scanner devrait être fermé après la validation de l'IBAN.")
    }

    func testResetScanner() {
        // Given
        mockCoordinator.ibanTextMock = "FR7612548029981234567890131"
        mockCoordinator.isShowingScannerMock = true
        
        // When
        viewModel.resetScanner()
        
        // Then
        XCTAssertEqual(mockCoordinator.ibanTextMock, "", "L'IBAN du coordinator devrait être réinitialisé.")
        XCTAssertFalse(mockCoordinator.isShowingScannerMock, "Le scanner devrait être fermé après réinitialisation.")
    }
}
