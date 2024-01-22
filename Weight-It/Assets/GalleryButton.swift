import SwiftUI
import PhotosUI

struct GalleryButton: View {
    @Binding var capturedImage: UIImage?
    @Binding var isCustomCameraViewPresented: Bool
    
    //placeholder for photo picker data
    @State private var photosPickerItem: PhotosPickerItem?

    var body: some View {
        HStack{
            // Camera button not needed anymore
            //Button(action: {
            //    isCustomCameraViewPresented.toggle()
            //}, label: {
            //    Image(systemName: "camera.fill")
            //        .font(.largeTitle)
            //        .padding()
            //        .background(Color(AppColors.primaryColor))
            //        .foregroundColor(.white)
            //        .clipShape(Circle())
            //})
            //.sheet(isPresented: $isCustomCameraViewPresented, content: {
            //    CustomCameraVeiw(capturedImage: $capturedImage)
            //})
            
            //Photo Picker button implementation
            PhotosPicker(selection: $photosPickerItem,
                         matching: .images) {
                Image(systemName: "photo")
                    .font(.largeTitle)
                    .padding()
                    .background(Color(AppColors.primaryColor))
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
