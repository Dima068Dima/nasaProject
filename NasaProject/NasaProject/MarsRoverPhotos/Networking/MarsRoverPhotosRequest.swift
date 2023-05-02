import Foundation

class MarsRoverPhotosRequestImp: MarsRoverPhotosRequest {
    private let networkService: NetworkService
    private let url = "https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?earth_date=2015-6-3&api_key=JLcg1Oly6SH0ll09eizVQDIVeLdgmmgcduguyceE"
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    func getMarsRoverPhotos() async throws -> [MarsPhotos] {
        let response = try await networkService.get(
            of: MarsRoverPhotosModel.self,
            url: url,
            parameters: [:],
            headers: [:]
        )
        return response.toMarsPhotos()
    }
}

typealias MarsRoverPhotosModel = [MarsPhotosModel]

struct MarsPhotosModel: Codable {
    let id: Int
    let camera: CameraModel
    let imgSrc: String
    let earthDate: String
    let rover: RoverModel
    
    enum CodingKeys: String, CodingKey {
        case camera, id
        case imgSrc = "img_src"
        case earthDate = "earth_date"
        case rover
    }
}

struct CameraModel: Codable {
    let name: String
    let fullName: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case fullName = "full_name"
    }
}

struct RoverModel: Codable {
    let name: String
    let landingDate: String
    let launchDate: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case landingDate = "landing_date"
        case launchDate = "launch_date"
    }
}

extension MarsRoverPhotosModel {
    func toMarsPhotos() -> [MarsPhotos] {
        let model = self.map { data in
            MarsPhotos(
                id: Int(data.id),
                camera: data.camera.toCamera(),
                imgSrc: data.imgSrc,
                earthDate: data.earthDate,
                rover: data.rover.toRover()
            )
        }
        return model
    }
}

extension CameraModel {
    func toCamera() -> Camera {
        return Camera(name: self.name, fullName: self.fullName)
    }
}

extension RoverModel {
    func toRover() -> Rover {
        return Rover(
            name: self.name,
            landingDate: self.landingDate,
            launchDate: self.launchDate
        )
    }
}
