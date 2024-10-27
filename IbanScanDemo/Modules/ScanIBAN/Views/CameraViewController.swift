//
//  CameraViewController.swift
//  IbanScanDemo
//
//  Created by Aladdin Houas on 27/10/2024.
//

import UIKit
import AVFoundation
import Vision

protocol CameraViewControllerDelegate: AnyObject {
    func cameraViewController(_ controller: CameraViewController, didDetect text: String)
}

class CameraViewController: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate {
    weak var delegate: CameraViewControllerDelegate?
    private var captureSession = AVCaptureSession()
    private var textRequest = VNRecognizeTextRequest()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCamera()
        setupVision()
    }

    private func setupCamera() {
        captureSession.sessionPreset = .medium
        guard let videoDevice = AVCaptureDevice.default(for: .video),
              let videoInput = try? AVCaptureDeviceInput(device: videoDevice),
              captureSession.canAddInput(videoInput) else {
            return
        }
        captureSession.addInput(videoInput)

        let videoOutput = AVCaptureVideoDataOutput()
        videoOutput.setSampleBufferDelegate(self, queue: DispatchQueue(label: "cameraQueue"))
        guard captureSession.canAddOutput(videoOutput) else { return }
        captureSession.addOutput(videoOutput)

        let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer.videoGravity = .resizeAspectFill
        previewLayer.frame = view.layer.bounds
        view.layer.addSublayer(previewLayer)
        
        captureSession.startRunning()
    }

    private func setupVision() {
        textRequest = VNRecognizeTextRequest { [weak self] (request, error) in
            guard let observations = request.results as? [VNRecognizedTextObservation],
                  let topCandidate = observations.first?.topCandidates(1).first else {
                return
            }
            let detectedText = topCandidate.string
            if detectedText.starts(with: "FR") && detectedText.count == 27 { // Simple vérification IBAN FR
                DispatchQueue.main.async {
                    self?.delegate?.cameraViewController(self!, didDetect: detectedText)
                }
            }
        }
        textRequest.recognitionLevel = .accurate
        textRequest.usesLanguageCorrection = false
    }

    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        guard let pixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else { return }
        let requestHandler = VNImageRequestHandler(cvPixelBuffer: pixelBuffer, orientation: .right)
        do {
            try requestHandler.perform([textRequest])
        } catch {
            print("Error performing text detection: \(error)")
        }
    }
}
