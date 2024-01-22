import SwiftUI


struct PicView: View {
    @Binding var capturedImage: UIImage?
    @Binding var isCustomCameraViewPresented: Bool

    var body: some View {
        VStack{
            if capturedImage != nil{
                Image(uiImage: capturedImage!)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(30.0)
                    .frame(height: 400)
            }
            HStack{
                Button(action: {
                    // Add analise image button
                }, label: {
                    Image(systemName: "checkmark")
                        .font(.largeTitle)
                        .padding()
                        .background(Color(AppColors.primaryColor))
                        .foregroundColor(.white)
                        .clipShape(Circle())
                })
                Button(action: {
                    isCustomCameraViewPresented.toggle()
                    capturedImage = nil
                }, label: {
                    Image(systemName: "arrow.triangle.2.circlepath.camera")
                        .font(.largeTitle)
                        .padding()
                        .background(Color(AppColors.primaryColor))
                        .foregroundColor(.white)
                        .clipShape(Circle())
                })
            }
        }
    }
}
