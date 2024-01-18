import SwiftUI


struct NoPicView: View {
    @Binding var capturedImage: UIImage?
    @Binding var isCustomCameraViewPresented: Bool

    var body: some View {
        ZStack{
            Image(uiImage: capturedImage!)
                .resizable()
                .scaledToFit()
                .cornerRadius(30.0)
            HStack{
                Button(action: {
                    // Add analise image button
                }, label: {
                    Image(systemName: "checkmark")
                        .font(.largeTitle)
                        .padding()
                        .background(Color(AppColors.secondaryColor))
                        .foregroundColor(.white)
                        .clipShape(Circle())
                })
                .sheet(isPresented: $isCustomCameraViewPresented, content: {
                    CustomCameraVeiw(capturedImage: $capturedImage)
                })
                Button(action: {
                    isCustomCameraViewPresented.toggle()
                }, label: {
                    Image(systemName: "arrow.triangle.2.circlepath.camera")
                        .font(.largeTitle)
                        .padding()
                        .background(Color(AppColors.secondaryColor))
                        .foregroundColor(.white)
                        .clipShape(Circle())
                })
                .sheet(isPresented: $isCustomCameraViewPresented, content: {
                    CustomCameraVeiw(capturedImage: $capturedImage)
                })
            }
            
        }
    }
}
