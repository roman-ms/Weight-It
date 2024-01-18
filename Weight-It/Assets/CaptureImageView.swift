import SwiftUI
import PhotosUI

struct CaptureImageView: View {
    @Binding var capturedImage: UIImage?
    @Binding var isCustomCameraViewPresented: Bool
    
    @State private var photosPickerItem: PhotosPickerItem?

    var body: some View {
        HStack{
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
            .sheet(isPresented: $isCustomCameraViewPresented, content: {
                CustomCameraVeiw(capturedImage: $capturedImage)
            })
            
            //Photo Picker button implementation
            PhotosPicker(selection: $photosPickerItem,
                         matching: .images) {
                Image(systemName: "photo")
                    .font(.largeTitle)
                    .padding()
                    .background(Color(AppColors.secondaryColor))
                    .foregroundColor(.white)
                    .clipShape(Circle())
            }
            //On change of photosPickerItem run this code
            .onChange(of: photosPickerItem) { _, _ in
                Task{
                    if let photosPickerItem,
                       let data = try? await photosPickerItem.loadTransferable(type: Data.self) {
                        if let image = UIImage(data: data) {
                            capturedImage = image
                        }
                    }
                    //Erase old selection
                    photosPickerItem = nil
                }
            }
        }
    }
}
