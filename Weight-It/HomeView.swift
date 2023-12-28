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
    
    var body: some View {
        ZStack{
            if capturedImage != nil {
                Image(uiImage: capturedImage!)
                    .resizable()
                    .scaledToFit()
                    .ignoresSafeArea()
            } else {
                Color(UIColor.systemBackground)
            }
            VStack {
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
}
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
