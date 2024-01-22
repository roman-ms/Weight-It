//
//  HomeView.swift
//  Weight-It
//
//  Created by Roman Meshkov on 12/16/23.
//

import Foundation
import SwiftUI
struct HomeView: View {
    
    //Camera Variables
    @State private var capturedImage: UIImage? = nil
    @State private var isCustomCameraViewPresented = false
    
    //Cal Bar count
    @State private var progressValue: CGFloat = 50
    
    var body: some View {
        ZStack{
            Color(UIColor.systemBackground)
            VStack {
                Text("Home")
                    .bold()
                ProgressBar(value: progressValue)
                    .frame(height: 70)
                //Need to implement Camera capture view into home screen directly
                
                if capturedImage != nil {
                    PicView(capturedImage: $capturedImage, isCustomCameraViewPresented: $isCustomCameraViewPresented)
                } else {
                    CustomCameraVeiw(capturedImage: $capturedImage)
                        .frame(width: 350, height: 400)
                        .cornerRadius(45.0)
                    Spacer()
                    GalleryButton(capturedImage: $capturedImage, isCustomCameraViewPresented: $isCustomCameraViewPresented)
                }
               Spacer()
            }
        }
    }
}
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
