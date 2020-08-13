
import Foundation
import Alamofire

typealias  CallResponse<T> = ((Result<T>, Int?) -> Void)?



protocol APIRequestHandler: HandleAPIResponse {

}

extension APIRequestHandler where Self: APIConfiguration {
    func send<T: Codable>(_ decode: T.Type, completion: CallResponse<T>) {
        request(self).validate().responseData(queue: .global()) { (response) in
            self.handleResponse(response, completionHandler: completion)
        }
    }
}


typealias NewsResponseObject = [News]


