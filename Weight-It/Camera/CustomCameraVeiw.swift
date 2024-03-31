//
//  CustomCameraVeiw.swift
//  Weight-It
//
//  Created by Roman Meshkov on 12/27/23.
//

import SwiftUI

struct CustomCameraView: View {
    
    let cameraService = CameraService()
    @Binding var capturedImage: UIImage?
    
    // Use a separate presentation mode for this specific view context.
    @Environment(\.presentationMode) private var cameraViewPresentationMode
    
    var body: some View {
        ZStack {
            CameraView(cameraService: cameraService) { result in
                switch result {
                case .success(let photo):
                    if let data = photo.fileDataRepresentation() {
                        capturedImage = UIImage(data: data)
                        // Dismiss only the camera view, not the entire sheet stack.
                        cameraViewPresentationMode.wrappedValue.dismiss()
                    } else {
                        print("Error: No image data found")
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
            VStack {
                Spacer()
                HStack{
                    Button(action: {
                        cameraService.capturePhoto()
                    }, label: {
                        Image(systemName: "circle")
                            .font(.system(size: 72))
                            .foregroundColor(.white)
                    })
                    .padding(.bottom)
                }
            }
        }
    }
}

