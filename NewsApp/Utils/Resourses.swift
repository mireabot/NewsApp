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
        static var search = UIImage(named: "search")
        static var notification = UIImage(named: "notification")
        static var articleDemo = UIImage(named: "articleDemo")
        static var arrow = UIImage(named: "arrow")
    }
    
    enum Strings {
        
    }
    
    enum API {
        static var key = "pub_138790f8baed8e896313d6ddec1db2febfb0e"
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
        static var secondaryGray = UIColor(named: "secondaryGray")
        static var secondaryText = UIColor(named: "secondaryText")
        static var gray2 = UIColor(named: "gray2")
    }
}
