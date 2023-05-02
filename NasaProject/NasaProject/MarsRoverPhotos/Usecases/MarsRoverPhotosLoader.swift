import Foundation

protocol MarsRoverPhotosLoader {
    func execute() async throws -> [MarsPhotos]
}

class MarsRoverPhotosLoaderImp: MarsRoverPhotosLoader {
    private let marsRoverPhotosRequest: MarsRoverPhotosRequest
   
    init(marsRoverPhotosRequest: MarsRoverPhotosRequest) {
        self.marsRoverPhotosRequest = marsRoverPhotosRequest
    }
    
    func execute() async throws -> [MarsPhotos] {
        let marsRoverPhotos = try await marsRoverPhotosRequest.getMarsRoverPhotos()
        return marsRoverPhotos
    }
}

protocol MarsRoverPhotosRequest {
    func getMarsRoverPhotos() async throws -> [MarsPhotos]
}

struct MarsPhotos: Identifiable {
    var identifier: Int { self.id }
    let id: Int
    let camera: Camera
    let imgSrc: String
    let earthDate: String
    let rover: Rover
}

struct Camera {
    let name: String
    let fullName: String
}

struct Rover {
    let name: String
    let landingDate: String
    let launchDate: String
}
