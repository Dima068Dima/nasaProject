
import Foundation

protocol PictureDayLoader {
    func execute() async throws -> PictureDayModel
}

class PictureDayLoaderImp: PictureDayLoader {
    private let pictureDayRequest: PictureDayRequest
   
    init(pictureDayRequest: PictureDayRequest) {
        self.pictureDayRequest = pictureDayRequest
    }
    
    func execute() async throws -> PictureDayModel {
        let pictureDayRequest = try await pictureDayRequest.getPicture()
        return pictureDayRequest
    }
}

protocol PictureDayRequest {
    func getPicture() async throws -> PictureDayModel
}

struct PictureDayModel {
    let day: String
}
