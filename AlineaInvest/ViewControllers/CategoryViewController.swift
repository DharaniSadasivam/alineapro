//
//  CategoryViewController.swift
//  AlineaInvest
//
//  Created by Dharani Sadasivam on 12/08/20.
//  Copyright © 2020 Dharani Sadasivam. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController {
    
    var tableView: UITableView!
    var categories: [Categories] = [Categories(name: "Stocks", color: "stockColor", image: #imageLiteral(resourceName: "stockIcon")), Categories(name: "ETFs", color: "etfsColor", image: #imageLiteral(resourceName: "groupIcon")), Categories(name: "Crypto", color: "cryptoColor", image: #imageLiteral(resourceName: "tipsIcon"))]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func setupViews() {
        tableView = UITableView(frame: .zero, style: .plain)
        tableView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        view.addSubview(tableView)
        tableView.register(CategoryTableViewCell.self, forCellReuseIdentifier: "CategoryTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .singleLine
        tableView.alwaysBounceVertical = false
        tableView.tableFooterView = UIView(frame: .zero)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10), tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0), tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
                                     tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)])
    }
    
}

//MARK:- UITableViewDelegate, UITableViewDataSource
extension CategoryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryTableViewCell", for: indexPath) as! CategoryTableViewCell
        cell.titleLbl.text = categories[indexPath.row].name
        cell.mainView.backgroundColor = UIColor(named: categories[indexPath.row].color)
        cell.imgView.image = categories[indexPath.row].image.withRenderingMode(.alwaysTemplate)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}



struct Categories {
    var name: String
    var color: String
    var image: UIImage
}
