//
//  ThemesViewController.swift
//  AlineaInvest
//
//  Created by Dharani Sadasivam on 12/08/20.
//  Copyright © 2020 Dharani Sadasivam. All rights reserved.
//

import UIKit
import SDWebImage
import MBProgressHUD

class ThemesViewController: UIViewController {
    var themesCollectionView: UICollectionView!
    var themesViewModel: ThemesViewModel?
    var news: [News]? {
        didSet {
            guard let news = news else { return }
            themesViewModel = ThemesViewModel.init(news)
            DispatchQueue.main.async {
                self.themesCollectionView.reloadData()
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        getNewsAPI()
    }
    
    func setupViews() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumLineSpacing = 20
        
        themesCollectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        themesCollectionView.delegate = self
        themesCollectionView.dataSource = self
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        themesCollectionView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        themesCollectionView.register(ThemesCollectionViewCell.self, forCellWithReuseIdentifier: "ThemesCollectionViewCell")
        themesCollectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(themesCollectionView)
        NSLayoutConstraint.activate([themesCollectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20), themesCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0), themesCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20), themesCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)])
    }
    
    
    func getNewsAPI() {
        MBProgressHUD.showAdded(to: view, animated: true)
        APIRouter.getMarketNews.send([News].self) { (result, statusCode) in
            DispatchQueue.main.async {
                MBProgressHUD.hide(for: self.view, animated: true)
                switch result {
                case .success(let news):
                    self.news = news
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    
}

//MARK: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout

extension ThemesViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.news?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ThemesCollectionViewCell", for: indexPath) as! ThemesCollectionViewCell
        
        cell.titleLbl.text = themesViewModel?.getTitleByIndex(indexPath.row)
        if let imageUrl = URL(string: themesViewModel?.getImageUrlByIndex(indexPath.row) ?? "") {
            cell.imgView.sd_imageIndicator = SDWebImageActivityIndicator.grayLarge
            cell.imgView.sd_setImage(with: imageUrl, completed: nil)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (themesCollectionView.frame.width/2) - 10, height: 180)
    }
    
}


