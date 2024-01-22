//
//  ImageCrop.swift
//  Weight-It
//
//  Created by Roman Meshkov on 1/22/24.
//

import Foundation
import UIKit

extension UIImage {
    func cropToCenter(width: CGFloat, height: CGFloat) -> UIImage? {
        let contextImage: UIImage = UIImage(cgImage: self.cgImage!)
        
        let contextSize: CGSize = contextImage.size
        let posX: CGFloat = (contextSize.width - width) / 2
        let posY: CGFloat = (contextSize.height - height) / 2
        let rect: CGRect = CGRect(x: posX, y: posY, width: width, height: height)

        // Check if the rectangle is valid
        if rect.width <= 0 || rect.height <= 0 {
            return nil
        }

        let imageRef: CGImage = contextImage.cgImage!.cropping(to: rect)!
        let image: UIImage = UIImage(cgImage: imageRef, scale: self.scale, orientation: self.imageOrientation)

        return image
    }
}
