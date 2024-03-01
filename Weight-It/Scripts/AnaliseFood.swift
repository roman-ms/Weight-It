import SwiftUI
import UIKit

struct AnaliseFood: View {
    @Binding var capturedImage: UIImage?
    @Binding var isCustomCameraViewPresented: Bool

    @State private var isClassifying = false
    @State private var classificationResult: String?
    @State private var classificationConfidence: String?
    @State private var showNutritionView = false

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
                    isClassifying = true
                    
                    if let image = capturedImage {
                        let viewController = ViewController()
                        DispatchQueue.global().async {
                            viewController.classifyImage(image) { result in
                                DispatchQueue.main.async {
                                    if let result = result {
                                        //Parse string to separate confidence and classification result
                                        classificationResult = result.split(separator: "-").first?.trimmingCharacters(in: .whitespaces).replacingOccurrences(of: "_", with: " ") ?? ""
                                        classificationConfidence = result.split(separator: "-").last?.trimmingCharacters(in: .whitespaces) ?? ""
                                        showNutritionView = true
                                    } else {
                                        classificationResult = "Nothing recognized."
                                    }
                                    isClassifying = false
                                }
                            }
                        }
                    }
                }, label: {
                    Text("Analyze")
                        .font(.title)
                        .padding()
                        .background(Color(AppColors.primaryColor))
                        .foregroundColor(.white)
                        .cornerRadius(45)
                })
                .disabled(isClassifying)
                .sheet(isPresented: $showNutritionView) {
                    // Pass the classification result to NutritionView
                    if let result = classificationResult {
                        NutritionView(searchQuery: result)
                    }
                }
                
                Button(action: {
                    isCustomCameraViewPresented.toggle()
                    capturedImage = nil
                }, label: {
                    Image(systemName: "arrow.triangle.2.circlepath.camera")
                        .font(.largeTitle)
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .clipShape(Circle())
                })
            }
            
            if let result = classificationResult {
                Text(result)
                    .font(.headline)
            }
        }
    }
}
