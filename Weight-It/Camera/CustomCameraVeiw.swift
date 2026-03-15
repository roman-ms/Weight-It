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
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        ZStack {
            CameraView(cameraService: cameraService) { result in
                switch result {
                case .success(let photo):
                    if let data = photo.fileDataRepresentation() {
                        capturedImage = UIImage(data: data)
                        dismiss()
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

