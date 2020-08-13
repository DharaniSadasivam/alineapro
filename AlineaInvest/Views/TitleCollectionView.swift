//
//  TitleCollectionView.swift
//  AlineaInvest
//
//  Created by Dharani Sadasivam on 13/08/20.
//  Copyright © 2020 Dharani Sadasivam. All rights reserved.
//

import Foundation
import UIKit

class TitleCollectionViewCell: UICollectionViewCell {
    
    let titleLbl: UILabel = {
        let lbl = UILabel()
        lbl.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        lbl.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        lbl.font = UIFont.boldSystemFont(ofSize: 14)
        lbl.textAlignment = .center
        return lbl
    }()
    
    let underLine: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(titleLbl)
        addSubview(underLine)
        
        
        titleLbl.translatesAutoresizingMaskIntoConstraints = false
        underLine.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLbl.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            titleLbl.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0),
            titleLbl.heightAnchor.constraint(equalToConstant: 35)
        ])
        
        NSLayoutConstraint.activate([
            underLine.leadingAnchor.constraint(equalTo: titleLbl.leadingAnchor, constant: 0),
            underLine.trailingAnchor.constraint(equalTo: titleLbl.trailingAnchor, constant: 0),
            underLine.topAnchor.constraint(equalTo: titleLbl.bottomAnchor, constant: -2),
            underLine.heightAnchor.constraint(equalToConstant: 2.5)
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
