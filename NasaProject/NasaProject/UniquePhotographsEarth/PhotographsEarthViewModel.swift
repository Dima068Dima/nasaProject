import Foundation

class PhotographsEarthViewModel: ObservableObject {
    @Published private(set) var photographsEarthModel: [PhotographsEarth]
    
    private let photographsEarthLoader: PhotographsEarthLoader
    
    init(photographsEarthLoader: PhotographsEarthLoader) {
        self.photographsEarthModel = []
        self.photographsEarthLoader = photographsEarthLoader
    }
    
 @MainActor func loadData() {
        Task {
            do {
                let model = try await photographsEarthLoader.execute()
                photographsEarthModel = model
            } catch {
                
            }
        }
    }
}
