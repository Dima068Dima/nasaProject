import Foundation

protocol PhotographsEarthLoader {
    func execute() async throws -> [PhotographsEarth]
}

class PhotographsEarthLoaderImp: PhotographsEarthLoader {
    private let photographsEarthRequest: PhotographsEarthRequest
   
    init(photographsEarthRequest: PhotographsEarthRequest) {
        self.photographsEarthRequest = photographsEarthRequest
    }
    
    func execute() async throws -> [PhotographsEarth] {
        let pictureDayRequest = try await photographsEarthRequest.getPhotographsEarth()
        return pictureDayRequest
    }
}

protocol PhotographsEarthRequest {
    func getPhotographsEarth() async throws -> [PhotographsEarth]
}

struct PhotographsEarth: Identifiable {
    var id: String { self.identifier }
    let identifier: String
    let caption: String
    let image: String
}
