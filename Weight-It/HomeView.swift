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
    
    //Cal Bar
    @State private var progressValue: CGFloat = 50
    
    var body: some View {
        ZStack{
            Color(UIColor.systemBackground)
            VStack {
                Text("Today's Caloeries:")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    .bold()
                ProgressBar(value: progressValue)
                    .frame(height: 40)
                Spacer()
                if capturedImage != nil {
                    ZStack{
                        Image(uiImage: capturedImage!)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 500, height: 500)
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
                        .padding(.bottom)
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
