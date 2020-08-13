//
//  ExploreViewController.swift
//  AlineaInvest
//
//  Created by Dharani Sadasivam on 12/08/20.
//  Copyright © 2020 Dharani Sadasivam. All rights reserved.
//

import UIKit

class ExploreViewController: UIViewController {
    
    var titleCollectionView: UICollectionView!
    var pageSelectedIndex: Int = 0
    var pageController: PageViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let swipeGestureRecongnizer = UISwipeGestureRecognizer(target: self, action: #selector(actionOnRightSwipeGesture(_:)))
        swipeGestureRecongnizer.direction = .right
        
        let swipeLeftGestureRecog = UISwipeGestureRecognizer(target: self, action: #selector(actionOnLeftGesture(_:)))
        
        self.view.addGestureRecognizer(swipeGestureRecongnizer)
        self.view.addGestureRecognizer(swipeLeftGestureRecog)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupViews()
    }
    
    @objc func actionOnRightSwipeGesture(_ gesture: UIGestureRecognizer) {
        
    }
    
    
    @objc func actionOnLeftGesture(_ gesture: UIGestureRecognizer) {
        
    }
    
    func setupViews() {
        
        self.view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        // Navigation Bar
        let menuItem = UIBarButtonItem(image: #imageLiteral(resourceName: "menuIcon"), style: .plain, target: self, action: #selector(actionOnMenu))
        let notificationItem = UIBarButtonItem(image: #imageLiteral(resourceName: "notificationIcon"), style: .plain, target: self, action: #selector(actionOnNotification))
        self.navigationController?.navigationBar.topItem?.title = "Explore"
        self.navigationController?.navigationBar.topItem?.setLeftBarButton(menuItem, animated: false)
        self.navigationController?.navigationBar.topItem?.setRightBarButton(notificationItem, animated: false)
        
        
        // ContainerView
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(containerView)
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            containerView.topAnchor.constraint(equalTo: view.topAnchor, constant: (self.navigationController?.navigationBar.frame.height ?? 0) + 60),
            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -(self.tabBarController?.tabBar.frame.height ?? 0)),
        ])
        
        //PageController
        pageController = PageViewController()
        pageController.pageControllerDelegate = self
        addChild(pageController)
        pageController.view.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(pageController.view)
        
        NSLayoutConstraint.activate([
            pageController.view.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            pageController.view.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            pageController.view.topAnchor.constraint(equalTo: containerView.topAnchor),
            pageController.view.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
        
        pageController.didMove(toParent: self)
        let viewController = pageController.pages[pageSelectedIndex]
        pageController.setViewControllers([viewController], direction:
            navigationDirection(pageSelectedIndex), animated: true, completion: nil)
        
        
        // Collectionview - For page title
        let layout = UICollectionViewFlowLayout()
        titleCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .horizontal
        titleCollectionView.translatesAutoresizingMaskIntoConstraints = false
        titleCollectionView.delegate = self
        titleCollectionView.dataSource = self
        titleCollectionView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        titleCollectionView.isScrollEnabled = false
        view.addSubview(titleCollectionView)
        
        titleCollectionView.register(TitleCollectionViewCell.self, forCellWithReuseIdentifier: "TitleCollectionViewCell")
        
        NSLayoutConstraint.activate([
            titleCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            titleCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            titleCollectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: (self.navigationController?.navigationBar.frame.height ?? 0) + 20),
            titleCollectionView.heightAnchor.constraint(equalToConstant: 60),
        ])
        titleCollectionView.reloadData()
    }
    
    @objc func actionOnMenu() {
        
    }
    
    @objc func actionOnNotification() {
        
    }
    
}

//MARK: UICollectionViewDelegate & UICollectionViewDataSource

extension ExploreViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ExploreSec.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TitleCollectionViewCell", for: indexPath) as! TitleCollectionViewCell
        
        cell.titleLbl.text = ExploreSec.allCases[indexPath.row].rawValue
        cell.titleLbl.textColor = pageSelectedIndex == indexPath.row ? #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1) : #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        cell.underLine.isHidden = pageSelectedIndex != indexPath.row
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (self.titleCollectionView.frame.width/3), height: 60)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let viewController = pageController.pages[indexPath.row]
        pageController.setViewControllers([viewController], direction:
            navigationDirection(indexPath.row), animated: true, completion: nil)
        self.pageSelectedIndex = indexPath.row
        titleCollectionView.reloadData()
    }
    
    func navigationDirection(_ index: Int) -> UIPageViewController.NavigationDirection {
        if index < self.pageController.pages.count {
            if index > pageSelectedIndex {
                return .forward
            } else if index < pageSelectedIndex {
                return .reverse
            }
        }
        return .forward
    }
}

// MARK:- PageControllerDelegate
extension ExploreViewController: PageControllerDelegate {
    func pageDidScroll(_ index: Int) {
        self.pageSelectedIndex = index
        self.titleCollectionView.reloadData()
    }
}

enum ExploreSec: String, CaseIterable {
    case category = "Category"
    case themes = "News"
    case trending = "Trending"
}


