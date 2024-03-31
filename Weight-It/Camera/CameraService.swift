//
//  CameraService.swift
//  Weight-It
//
//  Created by Roman Meshkov on 12/27/23.
//

import Foundation
import AVFoundation

class CameraService {
    
    var session: AVCaptureSession?
    
    //Propagate our inmage into the ContentVeiw
    var delegate: AVCapturePhotoCaptureDelegate?
    
    
    let output = AVCapturePhotoOutput()
    
    //Preview of the video when taking a photo
    let previewLayer = AVCaptureVideoPreviewLayer()
    
    
    func start(delegate: AVCapturePhotoCaptureDelegate, completion: @escaping(Error?) -> ()) {
        self.delegate = delegate
        checkPermissions(completion: completion)
    }
    
    private func checkPermissions(completion: @escaping(Error?) -> ()){
        switch AVCaptureDevice.authorizationStatus(for: .video) {
            
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) {
                [weak self] granted in guard granted else { return }
                DispatchQueue.main.async{
                    self?.setupCamera(completion: completion )
                }
            }
        case .restricted:
            break
        case .denied:
            break
        case .authorized:
            setupCamera(completion: completion)
        @unknown default:
            break
        }
    }
    
    private func setupCamera(completion: @escaping (Error?) -> ()){
        DispatchQueue.global(qos: .userInitiated).async {
            let session = AVCaptureSession()
            
            guard let device = AVCaptureDevice.default(for: .video) else {
                DispatchQueue.main.async {
                    completion(NSError(domain: "CameraService", code: -1, userInfo: [NSLocalizedDescriptionKey: "Unable to find a suitable camera device."]))
                }
                return
            }

            do {
                let input = try AVCaptureDeviceInput(device: device)
                
                DispatchQueue.main.async {
                    if session.canAddInput(input) {
                        session.addInput(input)
                    }
                    
                    if session.canAddOutput(self.output) {
                        session.addOutput(self.output)
                    }
                    
                    self.previewLayer.videoGravity = .resizeAspectFill
                    self.previewLayer.session = session
                    
                    session.startRunning()  // This is now off the main thread
                    self.session = session
                    
                    completion(nil)
                }
                
            } catch {
                DispatchQueue.main.async {
                    completion(error)
                }
            }
        }
    }

    
    func capturePhoto(with settings: AVCapturePhotoSettings = AVCapturePhotoSettings()){
        output.capturePhoto(with: settings, delegate: delegate!)
    }
}
