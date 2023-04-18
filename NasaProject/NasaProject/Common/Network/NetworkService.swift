import Foundation
import Alamofire

typealias NetworkParameters = [String:String]
typealias NetworkHeaders = [String:String]

protocol NetworkService {
    func get<T: Codable>(of type: T.Type, url: String, parameters: NetworkParameters, headers: NetworkHeaders) async throws -> T
    func post<T: Codable>(of type: T.Type, url: String, parameters: NetworkParameters, headers: NetworkHeaders) async throws -> T
}

extension NetworkHeaders {
    var toHTTPHeader: HTTPHeaders {
        return HTTPHeaders(self)
    }
}
