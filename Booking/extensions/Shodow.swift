//
//  Shodow.swift
//  Booking
//
//  Created by Денис Денисов on 24.02.2022.
//

import UIKit

extension UIView {

   func dropShadow() {
       layer.masksToBounds = false
       layer.shadowColor = UIColor.black.cgColor
       layer.shadowOpacity = 0.4
       layer.shadowOffset = CGSize(width: -1, height: 1)
       layer.shadowRadius = 15
       layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
       layer.shouldRasterize = true
       layer.rasterizationScale = UIScreen.main.scale
   }
}
