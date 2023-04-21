import Foundation

class PictureDayRequestImp: PictureDayRequest {
    private let networkService: NetworkService
    private let url = "https://api.nasa.gov/planetary/apod?api_key=kXvKqoVXHNxFLmKZmDGEysyrtr3MOhQphMmLJzAz"
    
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
    let date: String //, explanation: String
//        let hdurl: String
//        let mediaType, serviceVersion, title: String
//        let url: String
//
//        enum CodingKeys: String, CodingKey {
//            case date, explanation, hdurl
//            case mediaType = "media_type"
//            case serviceVersion = "service_version"
//            case title, url
//        }
}

extension PictureRequest {
    func toPictureDayModel() -> PictureDayModel {
        return PictureDayModel(day: self.date)
    }
}
