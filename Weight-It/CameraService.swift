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
    let previevLayer = AVCaptureVideoPreviewLayer()
    
    
    func start(delegate: AVCapturePhotoCaptureDelegate, completion: @escaping(Error?) -> ()) {
        self.delegate = delegate
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
        
    }
}
