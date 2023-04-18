
import Foundation
import Alamofire

class NetworkServiceImp: NetworkService {
    private let sessionAF: Session
    
    init() {
        let urlSessionConfig = URLSessionConfiguration.default
  
        self.sessionAF = Session(
            configuration: urlSessionConfig
        )
    }
    func get<T: Codable>(of type: T.Type = T.self, url: String, parameters: NetworkParameters = [:], headers: NetworkHeaders = [:]) async throws -> T {
        return try await withUnsafeThrowingContinuation { continuation in
            let headers = HTTPHeaders(headers)
            sessionAF.request(url, method: .get, parameters: parameters, headers: headers)
                .validate()
                .responseDecodable (of: T.self) { response in
                    if let value = response.value {
                        continuation.resume(returning: value)
                        return
                    }
                    if let error = response.error {
                        continuation.resume(throwing: error)
                        return
                    }
                }
        }
    }
    
    func post<T: Codable>(of type: T.Type = T.self, url: String, parameters: NetworkParameters = [:], headers: NetworkHeaders = [:]) async throws -> T {
        return try await withUnsafeThrowingContinuation { continuation in
            let headers = HTTPHeaders(headers)
             sessionAF.request(url, method: .post, parameters: parameters, encoder: .json, headers: headers)
                .validate()
                .responseDecodable(of: T.self) { response in
                    if let value = response.value {
                        continuation.resume(returning: value)
                        return
                    }
                    
                    if let error = response.error {
                        continuation.resume(throwing: error)
                        return
                    }
                }
        }
    }
}
