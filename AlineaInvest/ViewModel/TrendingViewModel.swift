//
//  TrendingViewModel.swift
//  AlineaInvest
//
//  Created by Dharani Sadasivam on 13/08/20.
//  Copyright © 2020 Dharani Sadasivam. All rights reserved.
//

import Foundation
import Alamofire

struct TrendingViewModel {
    var calendarInfo: [Calendar]
    var calendarSec: [String: [Calendar]]
    var calendarSecList: [String]
    
    init(_ calendarInfo: [Calendar]) {
        self.calendarInfo = calendarInfo
        self.calendarSec = Dictionary(grouping: self.calendarInfo, by: {$0.country})
        self.calendarSecList  = calendarSec.keys.map{$0}
    }

    
    func getSections() -> [String] {
        return calendarSecList
        
    }
    
    func getEvents(by index: Int) -> [Calendar]? {
        let key = getSectionKey(by: index)
        return calendarSec[key]
    }
    
    func getSectionKey(by index: Int) -> String {
        return calendarSecList[index]
    }
    
    func getEventNameBy(section: Int, rowIndex: Int) -> String {
        return getEvents(by: section)?[rowIndex].event ?? ""
    }
    
    func getEventSubtitleBy(section: Int, rowIndex: Int) -> String {
        return (getEvents(by: section)?[rowIndex].impact ?? "").uppercased()
    }
    
    func getEstimate(section: Int, rowIndex: Int) -> String {
        return "\(getEvents(by: section)?[rowIndex].estimate ?? 0.0)"
    }
    
    func getEstimateVal(section: Int, rowIndex: Int) -> Float {
        return getEvents(by: section)?[rowIndex].estimate ?? 0.0
    }
}
