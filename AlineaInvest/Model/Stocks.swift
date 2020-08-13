//
//  Stocks.swift
//  AlineaInvest
//
//  Created by Dharani Sadasivam on 13/08/20.
//  Copyright © 2020 Dharani Sadasivam. All rights reserved.
//

import Foundation
import UIKit

struct Calendar: Codable {
    var country: String
    var estimate: Float?
    var event: String
    var impact: String
}


struct EconomicCalendar: Codable {
    var economicCalendar: [Calendar]
}
