
import Foundation
import Combine

class PictureDayViewModel: ObservableObject {
    @Published private(set) var pictureDayModel: PictureDayModel?
    
    private let pictureDayLoader: PictureDayLoader
    private let alertMessenger: AlertMessenger
    
    init(
        pictureDayLoader: PictureDayLoader,
        alertMessenger: AlertMessenger
    ) {
        self.pictureDayLoader = pictureDayLoader
        self.alertMessenger = alertMessenger
    }
    
 @MainActor func loadData() {
        Task {
            do {
                let model = try await pictureDayLoader.execute()
                pictureDayModel = model
            } catch {
//                await MainActor.run {
//                    alertMessenger.presentAlert(
//                        title: "Ошибка",
//                        message: "Не удалось загрузить данные, попробуйте позже"
//                    )
//                }
            }
        }
    }
}
