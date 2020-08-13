

import Foundation
import Alamofire

protocol APIConfiguration: URLRequestConvertible, APIRequestHandler {
    //MARK:- URLs
    var mainUrl: URL { get }

    // MARK:- Methods
    var method: HTTPMethod { get }

    //MARK:- Path
    var path: ServerPaths { get }

    //MARK:- Parameters
    var parameters: Parameters? { get }

    //MARK:- Headers
    var headers: HTTPHeaders { get }

    var encoding: ParameterEncoding { get }

    var urlRequest: URLRequest { get }

    var deviceId: String { get }

}

extension APIConfiguration {
    //MARK:- Main url
    var mainUrl: URL {
            return URL(string: "\(BASE_URL)\(path.rawValue)")!
    }

    //MARK:- Headers
    var headers: HTTPHeaders {
        var commonHeaders =  HTTPHeaders()
       
        return commonHeaders
    }

    //MARK:- Encoding
    var encoding: ParameterEncoding {
        switch method {
        case .get:
            return URLEncoding.default
        default:
            return JSONEncoding.default
        }
    }

    //MARK:- URLRequest
    var urlRequest: URLRequest {
        var request = URLRequest(url: mainUrl)
        request.httpMethod = method.rawValue
       // request.timeoutInterval = 240
        headers.forEach{ request.addValue($1, forHTTPHeaderField: $0)}
        return request
    }

    var deviceId: String {
        return UIDevice.current.identifierForVendor?.uuidString ?? ""
    }

    func asURLRequest() throws -> URLRequest {
        return try encoding.encode(urlRequest, with: parameters)
    }

}


