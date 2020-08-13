//
//  MainTabbarViewController.swift
//  AlineaInvest
//
//  Created by Dharani Sadasivam on 12/08/20.
//  Copyright © 2020 Dharani Sadasivam. All rights reserved.
//

import UIKit

class MainTabbarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    

    func setupViews() {
        let homeViewController = ViewController()
        
        homeViewController.tabBarItem = UITabBarItem(title: "", image: #imageLiteral(resourceName: "homeIcon"), selectedImage: #imageLiteral(resourceName: "homeIcon").withRenderingMode(.alwaysTemplate))
        
        UITabBar.appearance().tintColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
        let exploreViewController = ExploreViewController()
        exploreViewController.tabBarItem = UITabBarItem(title: "", image: #imageLiteral(resourceName: "exploreIcon"), selectedImage: #imageLiteral(resourceName: "exploreIcon").withRenderingMode(.alwaysTemplate))
        
        let trendsViewController = TrendsViewController()
        trendsViewController.tabBarItem = UITabBarItem(title: "", image: #imageLiteral(resourceName: "stockIcon"), selectedImage: #imageLiteral(resourceName: "stockIcon").withRenderingMode(.alwaysTemplate))
        
        let groupViewController = GroupViewController()
        groupViewController.tabBarItem = UITabBarItem(title: "", image: #imageLiteral(resourceName: "groupIcon"), selectedImage: #imageLiteral(resourceName: "groupIcon").withRenderingMode(.alwaysTemplate))
        
        let ideaViewController = TipsViewController()
        ideaViewController.tabBarItem = UITabBarItem(title: "", image: #imageLiteral(resourceName: "tipsIcon"), selectedImage: #imageLiteral(resourceName: "tipsIcon").withRenderingMode(.alwaysTemplate))
        viewControllers = [homeViewController, exploreViewController, trendsViewController, groupViewController, ideaViewController]
        
    }

}


