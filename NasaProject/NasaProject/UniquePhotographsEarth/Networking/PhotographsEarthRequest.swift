import Foundation

class PhotographsEarthRequestImp: PhotographsEarthRequest {
    private let networkService: NetworkService
    private let url = "https://api.nasa.gov/EPIC/api/natural/date/2019-05-30?api_key=JLcg1Oly6SH0ll09eizVQDIVeLdgmmgcduguyceE"
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    func getPhotographsEarth() async throws -> [PhotographsEarth] {
        let response = try await networkService.get(
            of: PhotographsEarthModel.self,
            url: url,
            parameters: [:],
            headers: [:]
        )
        return response.toPhotographsEarthModel()
    }
}

typealias PhotographsEarthModel = [DataEarth]

struct DataEarth: Codable {
    let identifier: String
    let caption: String
    let image: String
}

extension PhotographsEarthModel {
    func toPhotographsEarthModel() -> [PhotographsEarth] {
        let model = self.map { data in
            PhotographsEarth(
                identifier: data.identifier,
                caption: data.caption,
                image: data.image
            )
        }
        return model
    }
}
