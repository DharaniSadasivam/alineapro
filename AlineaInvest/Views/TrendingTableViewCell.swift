//
//  TrendingTableViewCell.swift
//  AlineaInvest
//
//  Created by Dharani Sadasivam on 13/08/20.
//  Copyright © 2020 Dharani Sadasivam. All rights reserved.
//

import UIKit

class TrendingTableViewCell: UITableViewCell {
    let imgView: UIImageView = {
        let imgView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        imgView.contentMode = .scaleAspectFit
        return imgView
    }()
    
    let titleLbl: UILabel = {
        let lbl = UILabel()
        lbl.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        lbl.font = UIFont.boldSystemFont(ofSize: 14)
        lbl.textAlignment = .left
        lbl.numberOfLines = 2
        return lbl
    }()
    
    let descLbl: UILabel = {
        let lbl = UILabel()
        lbl.textColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        lbl.font = UIFont.boldSystemFont(ofSize: 14)
        lbl.textAlignment = .left
        return lbl
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        return stackView
    }()
    
    let stockLbl: UILabel = {
        let lbl = UILabel()
        lbl.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        lbl.font = UIFont.boldSystemFont(ofSize: 14)
    
        lbl.textAlignment = .left
    
        return lbl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(imgView)
        stackView.addArrangedSubview(titleLbl)
        stackView.addArrangedSubview(descLbl)
        titleLbl.clipsToBounds = true
        descLbl.clipsToBounds = true
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .fill
        contentView.addSubview(stackView)
        stackView.spacing = 5
        contentView.addSubview(stockLbl)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        imgView.translatesAutoresizingMaskIntoConstraints = false
        stockLbl.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([imgView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0),
                                     imgView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20), imgView.heightAnchor.constraint(equalToConstant: 30), imgView.widthAnchor.constraint(equalToConstant: 30)])
        
         NSLayoutConstraint.activate([stockLbl.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0), stockLbl.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),stockLbl.heightAnchor.constraint(equalToConstant: 25),  stockLbl.widthAnchor.constraint(equalToConstant: 80)])
        
        NSLayoutConstraint.activate([stackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0), stackView.leadingAnchor.constraint(equalTo: imgView.trailingAnchor, constant: 20),stackView.heightAnchor.constraint(equalToConstant: 60), stackView.trailingAnchor.constraint(equalTo: stockLbl.leadingAnchor, constant: -10) ])
        
       
        
        stockLbl.textAlignment = .center
      
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

