import SwiftUI

struct AddFoodView: View {
    @Environment(\.managedObjectContext) var managedObjContext
    @Environment(\.dismiss) var dismiss
    @State private var capturedImage: UIImage? = nil
    @State private var isCustomCameraViewPresented = false
    @State private var name = ""
    @State private var ingr1 = ""
    @State private var ingr2 = ""
    @State private var quantity: Double = 0
    @StateObject private var viewModel = ImageAnalysisViewModel()
    @State private var showNutritionView = false
    @State private var isLoading = false
    
    @StateObject private var nutritionViewModel = NutritionViewModel()
    

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
            TextField("Ingredient", text: $ingr1)
            TextField("Ingredient", text: $ingr2)
            HStack{
                TextField("Quantity", value: $quantity, format: .number)
                Text(" g") // Unit label
                Spacer()
            }
            
            Section {
                if let nutritionModel = nutritionViewModel.nutritionModel {
                    ScrollView {
                        VStack(spacing: 10) { // Increase spacing between lines here, adjust the value as needed
                            HStack {
                                Text("Energy (kcal): ")
                                    .bold() +
                                Text("\(nutritionModel.totalNutrients.ENERC_KCAL.quantity, specifier: "%.2f") \(nutritionModel.totalNutrients.ENERC_KCAL.unit)")
                                Spacer()
                            }
                            
                            HStack {
                                Text("Carbohydrate: ")
                                    .bold() +
                                Text("\(nutritionModel.totalNutrients.CHOCDF.quantity) g")
                                Spacer()
                            }
                            
                            HStack {
                                Text("Fat: ")
                                    .bold() +
                                Text("\(nutritionModel.totalNutrients.FAT.quantity) g")
                                Spacer()
                            }
                            
                            HStack {
                                Text("Protein: ")
                                    .bold() +
                                Text("\(nutritionModel.totalNutrients.PROCNT.quantity) g")
                                Spacer()
                            }
                            
                            HStack {
                                Text("Fiber: ")
                                    .bold() +
                                Text("\(nutritionModel.totalNutrients.FIBTG.quantity) g")
                                Spacer()
                            }
                        }
                        .multilineTextAlignment(.leading)
                    }
                }
            }
            
            Section {
                HStack {
                    Spacer()
                    Button("Analyze") {
                        showNutritionView = true // Trigger the sheet presentation
                        let combinedString = "\(ingr1) \(ingr2) \(name) \(quantity) g"
                        nutritionViewModel.loadNutritionData(for: combinedString)
                    }
                    Spacer()
                }
            }
            
            Section {
                HStack {
                    Spacer()
                    Button("Submit") {
                        if let nutritionModel = nutritionViewModel.nutritionModel {
                            DataController.addFood(name: name,
                                                     quantity: quantity,
                                                     kcal: nutritionModel.totalNutrients.ENERC_KCAL.quantity,
                                                     carbs: nutritionModel.totalNutrients.CHOCDF.quantity,
                                                     fat: nutritionModel.totalNutrients.FAT.quantity,
                                                     protein: nutritionModel.totalNutrients.PROCNT.quantity,
                                                     water: nutritionModel.totalNutrients.WATER.quantity,
                                                     fiber: nutritionModel.totalNutrients.FIBTG.quantity,
                                                     context: managedObjContext)
                            dismiss()
                        }
                    }
                    Spacer()
                }
            }
        }
        .navigationTitle("Add Food")
        .onReceive(viewModel.$classificationResult) { result in
            // Update the name with the classification result
            if let result = result, !result.isEmpty {
                self.name = result.capitalized
            }
            isLoading = false // Stop loading
        }
        .sheet(isPresented: $showNutritionView) {
            let combinedString = "\(ingr1) \(ingr2) \(name) \(quantity) g"
            // Present the NutritionView here
            NutritionView(searchQuery: combinedString)
        }
        
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
