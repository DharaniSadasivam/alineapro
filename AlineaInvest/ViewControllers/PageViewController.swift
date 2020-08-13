//
//  PageViewController.swift
//  AlineaInvest
//
//  Created by Dharani Sadasivam on 13/08/20.
//  Copyright © 2020 Dharani Sadasivam. All rights reserved.
//

import UIKit

protocol PageControllerDelegate: class {
    
    func pageDidScroll(_ index: Int)
}

class PageViewController: UIPageViewController {
    
    var pages = [UIViewController]()
    let pageControl = UIPageControl()
    weak var pageControllerDelegate: PageControllerDelegate?
    
    override func viewDidLoad() {
        self.dataSource = self
        self.delegate = self
        let initialPage = 0
        let page1 = CategoryViewController()
        let page2 = ThemesViewController()
        let page3 = TrendingViewController()
        self.pages.append(page1)
        self.pages.append(page2)
        self.pages.append(page3)
        setViewControllers([pages[initialPage]], direction: .forward, animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupViews()
    }
    
    func setupViews() {
        self.view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        let menuItem = UIBarButtonItem(image: #imageLiteral(resourceName: "menuIcon"), style: .plain, target: self, action: #selector(actionOnMenu))
        let notificationItem = UIBarButtonItem(image: #imageLiteral(resourceName: "notificationIcon"), style: .plain, target: self, action: #selector(actionOnNotification))
        self.navigationController?.navigationBar.topItem?.title = "Explore"
        self.navigationController?.navigationBar.topItem?.setLeftBarButton(menuItem, animated: false)
        self.navigationController?.navigationBar.topItem?.setRightBarButton(notificationItem, animated: false)
    }
    
    @objc func actionOnMenu() {
        
    }
    
    @objc func actionOnNotification() {
        
    }
    override init(transitionStyle style: UIPageViewController.TransitionStyle, navigationOrientation: UIPageViewController.NavigationOrientation, options: [UIPageViewController.OptionsKey : Any]? = nil) {
        super.init(transitionStyle: .scroll, navigationOrientation: navigationOrientation, options: options)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
//MARK:- UIPageViewControllerDataSource & UIPageViewControllerDelegate

extension PageViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if let viewControllerIndex = self.pages.firstIndex(of: viewController) {
               if viewControllerIndex != 0 {
                   return self.pages[viewControllerIndex - 1]
               }
           }
        
           return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if let viewControllerIndex = self.pages.firstIndex(of: viewController) {
               if viewControllerIndex < self.pages.count - 1 {
                   return self.pages[viewControllerIndex + 1]
               }
           }
           return nil
    }
    
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        guard completed, let currentViewController = pageViewController.viewControllers?.first else { return }
        let currentPageIndex = self.pages.firstIndex(of: currentViewController)!
        pageControllerDelegate?.pageDidScroll(currentPageIndex)
    }
    
}
