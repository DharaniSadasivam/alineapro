//
//  CategoryTableViewCell.swift
//  AlineaInvest
//
//  Created by Dharani Sadasivam on 13/08/20.
//  Copyright © 2020 Dharani Sadasivam. All rights reserved.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {
    
    let mainView: UIView = {
        let view = UIView()
        return view
    }()
    
    let titleLbl: UILabel = {
        let lbl = UILabel()
        lbl.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.textAlignment = .center
        return lbl
    }()
    
    let imgView: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        imgView.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        return imgView
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(mainView)
        mainView.addSubview(titleLbl)
        mainView.addSubview(imgView)
        
        mainView.translatesAutoresizingMaskIntoConstraints = false
        titleLbl.translatesAutoresizingMaskIntoConstraints = false
        imgView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mainView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20), mainView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20), mainView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            mainView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)])
        
        NSLayoutConstraint.activate([
            titleLbl.leadingAnchor.constraint(equalTo: imgView.trailingAnchor, constant: 20),
            titleLbl.centerYAnchor.constraint(equalTo: mainView.centerYAnchor, constant: 0),
            titleLbl.heightAnchor.constraint(equalToConstant: 35)
        ])
        
        NSLayoutConstraint.activate([imgView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 20), imgView.widthAnchor.constraint(equalToConstant: 25), imgView.heightAnchor.constraint(equalToConstant: 25), imgView.centerYAnchor.constraint(equalTo: mainView.centerYAnchor, constant: 0),])
        mainView.clipsToBounds = false
        mainView.layer.cornerRadius = 40
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


