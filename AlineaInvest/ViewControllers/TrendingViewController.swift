//
//  TrendingViewController.swift
//  AlineaInvest
//
//  Created by Dharani Sadasivam on 12/08/20.
//  Copyright © 2020 Dharani Sadasivam. All rights reserved.
//

import UIKit
import MBProgressHUD

class TrendingViewController: UIViewController {
    
    var tableView: UITableView!
    var viewModel: TrendingViewModel?
    
    var calendarInfo: [Calendar]? {
        didSet {
            guard let calendarInfo = calendarInfo else { return }
            viewModel = TrendingViewModel.init(calendarInfo)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        getCalendarAPI()
    }
    
    func setupViews() {
        tableView = UITableView(frame: .zero, style: .plain)
        tableView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        tableView.register(TrendingTableViewCell.self, forCellReuseIdentifier: "TrendingTableViewCell")
        tableView.translatesAutoresizingMaskIntoConstraints  = false
        tableView.tableFooterView =  UIView(frame: .zero)
        NSLayoutConstraint.activate([tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
                                     tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
                                     tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0), tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)])
        
    }
    
    func getCalendarAPI() {
        MBProgressHUD.showAdded(to: view, animated: true)
        APIRouter.getEconomicCalendar.send(EconomicCalendar.self) { (result, statusCode) in
            DispatchQueue.main.async {
                MBProgressHUD.hide(for: self.view, animated: true)
                switch result {
                case .success(let calendarInfo):
                    self.calendarInfo = calendarInfo.economicCalendar
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
}


//MARK:- UITableViewDelegate, UITableViewDataSource

extension TrendingViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel?.getSections().count ?? 0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel?.getSectionKey(by: section)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.getEvents(by: section)?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TrendingTableViewCell", for: indexPath) as! TrendingTableViewCell
        cell.titleLbl.text = viewModel?.getEventNameBy(section: indexPath.section, rowIndex: indexPath.row)
        cell.descLbl.text = viewModel?.getEventSubtitleBy(section: indexPath.section, rowIndex: indexPath.row)
        cell.imgView.image = #imageLiteral(resourceName: "stockIcon")
        cell.stockLbl.text = "\(viewModel?.getEstimate(section: indexPath.section, rowIndex: indexPath.row) ?? "0.0")%"
        cell.stockLbl.layer.cornerRadius = 12.5
        cell.stockLbl.layer.masksToBounds = true
        cell.stockLbl.backgroundColor = (viewModel?.getEstimateVal(section: indexPath.section, rowIndex: indexPath.row) ?? Float(0.0))  > Float(0.0) ? #colorLiteral(red: 0.2442031801, green: 0.8569825292, blue: 0.7060458064, alpha: 1) : #colorLiteral(red: 0.9912299514, green: 0.4158534408, blue: 0.4209648967, alpha: 1)
        cell.selectionStyle =  .none
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}


