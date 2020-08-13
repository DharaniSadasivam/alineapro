

import Foundation
import Alamofire

enum APIRouter: APIConfiguration {
    case getMarketNews
    case getEconomicCalendar
    
    //MARK:- Path
    internal var path: ServerPaths {
        switch self {
        case .getMarketNews:
            return .getMarketNews
        case .getEconomicCalendar:
            return .getEconomicCalendar
        
        }
    }

    //MARK:- HTTPMethods
    internal var method: HTTPMethod {
        switch self {
        case .getMarketNews:
            return .get
        case .getEconomicCalendar:
            return .get
        }
    }


    //MARK:- Paramaters
    internal var parameters: Parameters? {
        switch self {
        case .getMarketNews:
            return ["category": "general","token": API_TOKEN]
        case .getEconomicCalendar:
            return ["token": API_TOKEN]
        }
    }

}

enum ServerPaths: String {
    case getMarketNews = "news"
    case getEconomicCalendar = "calendar/economic"
}
