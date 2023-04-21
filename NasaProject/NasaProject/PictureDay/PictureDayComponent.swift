
import Foundation
import NeedleFoundation
import SwiftUI

protocol PictureDayDependencies: Dependency {
    var networkService: NetworkService { get }
}

class PictureDayComponent: Component<PictureDayDependencies> {
    var pictureDayController: UIViewController {
        let swiftUIView = PictureDayView(viewModel: viewModel)
        let controller = UIHostingController(rootView: swiftUIView)
        return controller
    }
    
    private var viewModel: PictureDayViewModel {
        return PictureDayViewModel(pictureDayLoader: pictureDayLoader)
    }
    
    private var pictureDayLoader: PictureDayLoader {
        return PictureDayLoaderImp(pictureDayRequest: pictureDayRequest)
    }
    
    private var pictureDayRequest: PictureDayRequest {
        return PictureDayRequestImp(networkService: dependency.networkService)
    }
}
