import SwiftUI

struct CaptureImageView: View {
    @Binding var capturedImage: UIImage?
    @Binding var isCustomCameraViewPresented: Bool

    var body: some View {
        if capturedImage != nil {
            ZStack{
                Image(uiImage: capturedImage!)
                    .resizable()
                    .scaledToFit()

                Button(action: {
                    isCustomCameraViewPresented.toggle()
                }, label: {
                    Image(systemName: "arrow.triangle.2.circlepath.camera")
                        .font(.largeTitle)
                        .padding()
                        .background(Color.black)
                        .foregroundColor(.white)
                        .clipShape(Circle())
                })
                .sheet(isPresented: $isCustomCameraViewPresented, content: {
                    CustomCameraVeiw(capturedImage: $capturedImage)
                })
            }
        } else {
            Button(action: {
                isCustomCameraViewPresented.toggle()
            }, label: {
                Image(systemName: "camera.fill")
                    .font(.largeTitle)
                    .padding()
                    .background(Color.black)
                    .foregroundColor(.white)
                    .clipShape(Circle())
            })
            .padding(.bottom)
            .sheet(isPresented: $isCustomCameraViewPresented, content: {
                CustomCameraVeiw(capturedImage: $capturedImage)
            })
        }
    }
}
