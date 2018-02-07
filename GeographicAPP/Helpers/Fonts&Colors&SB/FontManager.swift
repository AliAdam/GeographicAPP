//
//  FontManager.swift
//  GeographicAPP
//
//  Created by Ali Adam on 2/6/18.
//  Copyright © 2017 Ali Adam. All rights reserved.
//

import UIKit


enum FontManager:String {
    case APPRegular
    case APPMedium
    case APPBold
    case APPLight
    
   private var fontName:String {
        return self.isRTL ? self.arabicFontName :self.englishFontName
    }
    
    private var englishFontName:String {
        switch self {
        case .APPRegular: return "Dubai-Regular"
        case .APPMedium: return "Dubai-Medium"
        case .APPLight: return "Dubai-Light"
        case .APPBold: return "Dubai-SemiBold"
        }
    }
    
    private var arabicFontName:String {
        switch self {
        case .APPRegular: return "Dubai-Regular"
        case .APPMedium: return "Dubai-Medium"
        case .APPLight: return "Dubai-Light"
        case .APPBold: return "Dubai-SemiBold"
        }
    }
    
   public func fontWith(size: CGFloat) -> UIFont {
    let font = UIFont(name:self.fontName,size:size)
        return font!
    }
    
    public func fontWith(englishFontName:String,  size: CGFloat) -> UIFont {
        switch englishFontName {
        case FontManager.APPRegular.englishFontName:  return FontManager.APPRegular.fontWith(size: size)
        case FontManager.APPMedium.englishFontName:  return FontManager.APPMedium.fontWith(size: size)
        case FontManager.APPLight.englishFontName:  return FontManager.APPLight.fontWith(size: size)
        case FontManager.APPBold.englishFontName:  return FontManager.APPBold.fontWith(size: size)
        default: return  FontManager.APPRegular.fontWith(size: size)
        }
        
    }
    
    private var isRTL:Bool {
        return false
    }
}


