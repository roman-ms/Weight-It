import SwiftUI
import UIKit

struct PicView: View {
    @Binding var capturedImage: UIImage?
    @Binding var isCustomCameraViewPresented: Bool

    // Step 1: Add a state variable to track classification progress
    @State private var isClassifying = false
    @State private var classificationResult: String?

    var body: some View {
        VStack {
            if capturedImage != nil {
                Image(uiImage: capturedImage!)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(30.0)
                    .frame(height: 400)
            }
            HStack {
                Button(action: {
                    // Step 2: Disable the button while classifying
                    isClassifying = true
                    
                    // Check if a capturedImage is available
                    if let image = capturedImage {
                        // Create an instance of ViewController and pass the image
                        let viewController = ViewController()
                        
                        // Perform classification asynchronously
                        DispatchQueue.global().async {
                            viewController.classifyImage(image) { result in
                                // Update the UI on the main thread
                                DispatchQueue.main.async {
                                    if let result = result {
                                        classificationResult = result
                                    } else {
                                        classificationResult = "Nothing recognized."
                                    }
                                    // Step 2: Enable the button after classification is finished
                                    isClassifying = false
                                }
                            }
                        }
                    }
                }, label: {
                    Image(systemName: "checkmark")
                        .font(.largeTitle)
                        .padding()
                        .background(Color.blue) // Change to your desired color
                        .foregroundColor(.white)
                        .clipShape(Circle())
                })
                .disabled(isClassifying) // Disable the button while classifying
                
                Button(action: {
                    isCustomCameraViewPresented.toggle()
                    capturedImage = nil
                }, label: {
                    Image(systemName: "arrow.triangle.2.circlepath.camera")
                        .font(.largeTitle)
                        .padding()
                        .background(Color.red) // Change to your desired color
                        .foregroundColor(.white)
                        .clipShape(Circle())
                })
            }
            
            // Step 3: Display the classification result
            if let result = classificationResult {
                Text(result)
                    .font(.headline)
            }
        }
    }
}
