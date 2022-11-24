//
//  Resourses.swift
//  NewsApp
//
//  Created by Mikhail Kolkov on 11/24/22.
//

import UIKit

enum R {
    
    enum Images {
        static var feed = UIImage(named: "feed")
        static var favorites = UIImage(named: "favorites")
        static var profile = UIImage(named: "profile")
    }
    
    enum Strings {
        
    }
    
    enum API {
        
    }
    
    enum Fonts {
        static func regular(with size: CGFloat) -> UIFont {
            UIFont(name: "GillSans", size: size) ?? UIFont()
        }
        static func bold(with size: CGFloat) -> UIFont {
            UIFont(name: "GillSans-Bold", size: size) ?? UIFont()
        }
    }
    
    enum Colors {
        static var primary = UIColor(named: "primary")
        static var secondary = UIColor(named: "secondary")
    }
}
