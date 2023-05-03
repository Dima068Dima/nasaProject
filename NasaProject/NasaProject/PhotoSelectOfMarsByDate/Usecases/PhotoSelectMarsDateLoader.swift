import Foundation

protocol PhotoSelectMarsDateLoader {
    func execute(selectedDate: String) async throws -> [MarsPhotos]
}

class PhotoSelectMarsDateLoaderImp: PhotoSelectMarsDateLoader {
    private let photoSelectMarsDateRequest: PhotoSelectMarsDateRequest
    
    init(photoSelectMarsDateRequest: PhotoSelectMarsDateRequest) {
        self.photoSelectMarsDateRequest = photoSelectMarsDateRequest
    }
    
    func execute(selectedDate: String) async throws -> [MarsPhotos] {
        let marsRoverPhotos = try await photoSelectMarsDateRequest.getMarsRoverPhotos(selectedDate: selectedDate)
        return marsRoverPhotos
    }
    
    
}

protocol PhotoSelectMarsDateRequest {
    func getMarsRoverPhotos(selectedDate: String) async throws -> [MarsPhotos]
}
