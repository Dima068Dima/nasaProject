
import Foundation
import Combine

class PictureDayViewModel: ObservableObject {
    @Published private(set) var pictureDayModel: PictureDayModel?
    
    private let pictureDayLoader: PictureDayLoader
    
    init(pictureDayLoader: PictureDayLoader) {
        self.pictureDayLoader = pictureDayLoader
    }
    
 @MainActor func loadData() {
        Task {
            do {
                let model = try await pictureDayLoader.execute()
                pictureDayModel = model
            } catch {
                
            }
        }
    }
}
