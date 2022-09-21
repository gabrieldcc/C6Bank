//
//  UIView+.swift
//  C6Bank
//
//  Created by Gabriel de Castro Chaves on 20/09/22.
//

import UIKit

extension UIView {
    
    func addShadow(opacity: Float = 1) {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 10
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
        layer.cornerRadius = 10
    }
    
    
    
  
}

