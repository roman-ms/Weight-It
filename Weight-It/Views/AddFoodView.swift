import SwiftUI

struct AddFoodView: View {
    @Environment(\.managedObjectContext) var managedObjContext
    @Environment(\.dismiss) var dismiss
    @State private var capturedImage: UIImage? = nil
    @State private var isCustomCameraViewPresented = false
    @State private var name = ""
    @State private var quantity: Double = 0
    @StateObject private var viewModel = ImageAnalysisViewModel()
    @State private var showNutritionView = false
    @State private var isLoading = false

    var body: some View {
        Form {
            HStack{
                TextField("Food Name", text: $name)
                Button(action: {
                    isCustomCameraViewPresented = true
                }, label: {
                    Image(systemName: "camera")
                })
                .fullScreenCover(isPresented: $isCustomCameraViewPresented, onDismiss: {
                    isLoading = true // Start loading
                    if let capturedImage = capturedImage {
                        viewModel.classifyImage(capturedImage)
                    }
                }, content: {
                    CustomCameraView(capturedImage: $capturedImage)
                })
            }
            HStack{
                TextField("Quantity", value: $quantity, format: .number)
                Text(" g") // Unit label
                Spacer()
            }
            
            Section {
                HStack {
                    Spacer()
                    Button("Analyze") {
                        showNutritionView = true // Trigger the sheet presentation
                    }
                    Spacer()
                }
            }
            
            Section {
                HStack {
                    Spacer()
                    Button("Submit") {
                        DataController().addFood(name: name, quantity: quantity, context: managedObjContext)
                        dismiss()
                    }
                    Spacer()
                }
            }
        }
        .onReceive(viewModel.$classificationResult) { result in
            // Update the name with the classification result
            if let result = result, !result.isEmpty {
                self.name = result.capitalized
            }
            isLoading = false // Stop loading
        }
        .sheet(isPresented: $showNutritionView) {
            let combinedString = "\(name) \(quantity) g"
            // Present the NutritionView here
            NutritionView(searchQuery: combinedString)
        }
        .padding(.top, -30) // Adjust the value as needed
        
        if isLoading { // Conditionally display the loading screen
                        LoadingView() // This could be a custom view or a simple overlay
                            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                            .background(Color.black.opacity(0.45))
                            .foregroundColor(Color.white)
                    }
    }
}

// Example of a simple LoadingView
struct LoadingView: View {
    var body: some View {
        VStack {
            ProgressView("Analyzing...")
                .scaleEffect(1.5)
                .progressViewStyle(CircularProgressViewStyle(tint: .white))
        }
    }
}
