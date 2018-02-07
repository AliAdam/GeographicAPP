//
//  ExtensionMKAnnotationView.swift
//  GeographicAPP
//
//  Created by Ali Adam on 2/6/18.
//  Copyright © 2018 Ali Adam. All rights reserved.
//

import UIKit
import MapKit

/// this extinsion to swizzling hitTest and  point function with my own implementation
/// to detect clicks inside cells 
private let swizzling: (AnyClass, Selector, Selector) -> () = { forClass, originalSelector, swizzledSelector in
    let originalMethod = class_getInstanceMethod(forClass, originalSelector)
    let swizzledMethod = class_getInstanceMethod(forClass, swizzledSelector)
    method_exchangeImplementations(originalMethod!, swizzledMethod!)
}

extension MKAnnotationView {
    
    static let swizzlingMKAnnotationView: Void = {
        let originalSelector = #selector(hitTest)
        let swizzledSelector = #selector(swizzled_hitTest)
        swizzling(MKAnnotationView.self, originalSelector, swizzledSelector)
        let originalSelector2 = #selector(point)
        let swizzledSelector2 = #selector(swizzled_point)
        swizzling(MKAnnotationView.self, originalSelector2, swizzledSelector2)
        
        
    }()
    
    @objc func swizzled_layoutSubviews() {
        swizzled_layoutSubviews()
        print("swizzled_layoutSubviews")
    }
    
    
    @objc func swizzled_hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let hitView = super.hitTest(point, with: event)
        if (hitView != nil)
        {
            self.superview?.bringSubview(toFront: self)
        }
        return hitView
    }
    @objc func swizzled_point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        let rect = self.bounds
        var isInside: Bool = rect.contains(point)
        if(!isInside)
        {
            for view in self.subviews
            {
                isInside = view.frame.contains(point)
                if isInside
                {
                    break
                }
            }
        }
        return isInside
    }
    
    
}

