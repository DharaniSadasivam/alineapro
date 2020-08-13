
import Foundation
import Alamofire

protocol HandleAPIResponse {
    func handleResponse<T: Codable>(_ response: DataResponse<Data>, completionHandler: CallResponse<T>)
}

extension HandleAPIResponse {
    
    func handleResponse<T: Codable>(_ response: DataResponse<Data>, completionHandler: CallResponse<T>) {
            
           switch response.result {
           case .success(let value):
               do {
                   let decoder = JSONDecoder()
                   let modules = try decoder.decode(T.self, from: value)
                   completionHandler?(Result<T>.success(modules), response.response?.statusCode)
               } catch {
                   completionHandler?(Result<T>.failure(error), response.response?.statusCode)
               }
           case .failure(let error):
               completionHandler?(Result<T>.failure(error), response.response?.statusCode)
           }
       }
}

