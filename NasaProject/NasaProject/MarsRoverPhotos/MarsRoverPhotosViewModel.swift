import Foundation

class MarsRoverPhotosViewModel: ObservableObject {
    @Published private(set) var marsPhotosModel: [MarsPhotos]
    
    private let marsRoverPhotosLoader: MarsRoverPhotosLoader
    
    init(marsRoverPhotosLoader: MarsRoverPhotosLoader) {
        self.marsPhotosModel = []
        self.marsRoverPhotosLoader = marsRoverPhotosLoader
    }
    
 @MainActor func loadData() {
        Task {
            do {
                let model = try await marsRoverPhotosLoader.execute()
                marsPhotosModel = model
            } catch {
                
            }
        }
    }
}
