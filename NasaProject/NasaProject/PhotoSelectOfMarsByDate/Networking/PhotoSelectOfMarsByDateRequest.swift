import Foundation

fileprivate let earthDate = "earth_date"
fileprivate let api = "api_key"

class PhotoSelectOfMarsByDateRequest: PhotoSelectMarsDateRequest {
    private let networkService: NetworkService
    private let url = "https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?"
    private let apiKey = "JLcg1Oly6SH0ll09eizVQDIVeLdgmmgcduguyceE"
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    func getMarsRoverPhotos(selectedDate: String) async throws -> [MarsPhotos] {
        let response = try await networkService.get(
            of: MarsRoverPhotosModel.self,
            url: url,
            parameters: [earthDate: selectedDate, api: apiKey],
            headers: [:]
        )
        return response.toMarsPhotos()
    }
}
