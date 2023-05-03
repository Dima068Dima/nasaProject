import Foundation


class PhotoSelectMarsDateViewModel: ObservableObject {
    @Published private(set) var marsPhotosModel: [MarsPhotos]
    @Published var enteredText = ""
    
    private let photoSelectMarsDateLoader: PhotoSelectMarsDateLoader
    
    init(photoSelectMarsDateLoader: PhotoSelectMarsDateLoader) {
        self.marsPhotosModel = []
        self.photoSelectMarsDateLoader = photoSelectMarsDateLoader
    }
    
    @MainActor func loadData(selectedDate: String) {
        Task {
            do {
                let model = try await photoSelectMarsDateLoader.execute(selectedDate: selectedDate)
                marsPhotosModel = model
            } catch {
                
            }
        }
    }
}
