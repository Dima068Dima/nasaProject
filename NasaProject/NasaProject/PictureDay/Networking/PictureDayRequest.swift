import Foundation

class PictureDayRequestImp: PictureDayRequest {
    private let networkService: NetworkService
    private let url = "https://api.nasa.gov/planetary/apod?api_key=JLcg1Oly6SH0ll09eizVQDIVeLdgmmgcduguyceE"
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    func getPicture() async throws -> PictureDayModel {
        return try await networkService.get(
            of: PictureRequest.self,
            url: url,
            parameters: [:],
            headers: [:]
        )
        .toPictureDayModel()
    }
}

struct PictureRequest: Codable {
    let date: String
    let explanation: String
    let hdurl: String
    let url: String
}

extension PictureRequest {
    func toPictureDayModel() -> PictureDayModel {
        return PictureDayModel(
            day: self.date,
            title: self.explanation,
            image: self.hdurl,
            url: self.url
        )
    }
}
