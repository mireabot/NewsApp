//
//  TabBarViewController.swift
//  NewsApp
//
//  Created by Mikhail Kolkov on 11/24/22.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupBar()
        configureControllers()
    }
    
    func configureControllers() {
        
        let feedController = UINavigationController(rootViewController: FeedController())
        let favoritesController = UINavigationController(rootViewController: FavoritesController())
        let profileController = UINavigationController(rootViewController: ProfileController())
        
        feedController.tabBarItem = UITabBarItem(title: "", image: R.Images.feed, tag: 0)
        favoritesController.tabBarItem = UITabBarItem(title: "", image: R.Images.favorites, tag: 1)
        profileController.tabBarItem = UITabBarItem(title: "", image: R.Images.profile, tag: 2)
        
        viewControllers = [feedController, favoritesController, profileController]
    }
    
    func setupBar() {
        tabBar.tintColor = R.Colors.primary
        tabBar.unselectedItemTintColor = R.Colors.secondary
    }
}
