import SwiftUI

struct CaptureImageView: View {
    @Binding var capturedImage: UIImage?
    @Binding var isCustomCameraViewPresented: Bool

    var body: some View {
        Button(action: {
            isCustomCameraViewPresented.toggle()
        }, label: {
            Image(systemName: "camera.fill")
                .font(.largeTitle)
                .padding()
                .background(Color(AppColors.secondaryColor))
                .foregroundColor(.white)
                .clipShape(Circle())
        })
        .padding(.bottom)
        .sheet(isPresented: $isCustomCameraViewPresented, content: {
            CustomCameraVeiw(capturedImage: $capturedImage)
        })
    }
}
