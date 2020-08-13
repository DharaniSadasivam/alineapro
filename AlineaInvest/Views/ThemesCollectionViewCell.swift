//
//  ThemesCollectionViewCell.swift
//  AlineaInvest
//
//  Created by Dharani Sadasivam on 13/08/20.
//  Copyright © 2020 Dharani Sadasivam. All rights reserved.
//

import UIKit

class ThemesCollectionViewCell: UICollectionViewCell {
    
    let imgView: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFill
        imgView.clipsToBounds = true
        return imgView
    }()
    
    let titleLbl: UILabel = {
        let lbl = UILabel()
        lbl.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        lbl.font = UIFont.boldSystemFont(ofSize: 12)
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        lbl.clipsToBounds = true
        return lbl
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .fill
        stackView.spacing = 10
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imgView)
        stackView.addArrangedSubview(titleLbl)
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        contentView.layer.cornerRadius = 12
        contentView.layer.masksToBounds = true
        contentView.clipsToBounds = true
        contentView.backgroundColor = #colorLiteral(red: 0.9795373082, green: 0.9844534993, blue: 0.9885836244, alpha: 1)
        contentView.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        contentView.layer.borderWidth = 0.25
        
        contentView.addSubview(stackView)
        
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        imgView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([imgView.heightAnchor.constraint(equalToConstant: 80), imgView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0), imgView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0), imgView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0), stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20), stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20), stackView.topAnchor.constraint(equalTo: imgView.bottomAnchor, constant:  0), stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0)])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

