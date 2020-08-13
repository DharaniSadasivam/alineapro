//
//  TrendingViewModel.swift
//  AlineaInvest
//
//  Created by Dharani Sadasivam on 13/08/20.
//  Copyright © 2020 Dharani Sadasivam. All rights reserved.
//

import Foundation
import Alamofire

struct ThemesViewModel {
    var news: [News]
    
    init(_ news: [News]) {
        self.news = news
    }
    
    func getTitleByIndex(_ index: Int) -> String {
        return self.news[index].headline == "" ? self.news[index].category : self.news[index].headline
    }
    
    func getImageUrlByIndex(_ index: Int) -> String {
        return self.news[index].image
    }
}
