//
//  UIImage+Extensions.swift
//  AlineaInvest
//
//  Created by Dharani Sadasivam on 12/08/20.
//  Copyright © 2020 Dharani Sadasivam. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
     func imageWithColor(color: UIColor, size: CGSize) -> UIImage {
        let rect: CGRect = CGRect(x: 0, y: 0, width: size.width, height: size.height)

        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(rect)

        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }

}
