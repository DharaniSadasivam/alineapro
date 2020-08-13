//
//  ViewController.swift
//  AlineaInvest
//
//  Created by Dharani Sadasivam on 12/08/20.
//  Copyright © 2020 Dharani Sadasivam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.topItem?.title = "Home"
        self.navigationController?.navigationBar.topItem?.setLeftBarButton(nil, animated: false)
        self.navigationController?.navigationBar.topItem?.setRightBarButton(nil, animated: false)
    }
}


class GroupViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.topItem?.title = "Groups"
               self.navigationController?.navigationBar.topItem?.setLeftBarButton(nil, animated: false)
               self.navigationController?.navigationBar.topItem?.setRightBarButton(nil, animated: false)
    }
}


class TrendsViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
      
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.topItem?.title = "Trends"
        self.navigationController?.navigationBar.topItem?.setLeftBarButton(nil, animated: false)
        self.navigationController?.navigationBar.topItem?.setRightBarButton(nil, animated: false)
    }
}


class TipsViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.topItem?.title = "Tips"
        self.navigationController?.navigationBar.topItem?.setLeftBarButton(nil, animated: false)
        self.navigationController?.navigationBar.topItem?.setRightBarButton(nil, animated: false)
    }
}

