import Foundation
import NeedleFoundation
import SwiftUI

protocol TabBarDependencies: Dependency {
    var networkService: NetworkService { get }
    var alertMessenger: AlertMessenger { get }
}

class TabBarComponent: Component<TabBarDependencies> {
    var tabBarController: UIViewController {
        let swiftUIView = TabBarView(
            viewModel: viewModel,
            pictureDayViewModel: pictureDayViewModel
        )
        let controller = UIHostingController(rootView: swiftUIView)
        return controller
    }
    
    private var viewModel: PhotographsEarthViewModel {
        return PhotographsEarthViewModel(photographsEarthLoader: photographsEarthLoader)
    }
    
    private var photographsEarthLoader: PhotographsEarthLoader {
        return PhotographsEarthLoaderImp(photographsEarthRequest: photographsEarthRequest)
        
    }
    
    private var photographsEarthRequest: PhotographsEarthRequest {
        return PhotographsEarthRequestImp(networkService: dependency.networkService)
    }
    
    private var pictureDayViewModel: PictureDayViewModel {
        return PictureDayViewModel(
            pictureDayLoader: pictureDayLoader,
            alertMessenger: dependency.alertMessenger
        )
    }
    
    private var pictureDayLoader: PictureDayLoader {
        return PictureDayLoaderImp(pictureDayRequest: pictureDayRequest)
    }
    
    private var pictureDayRequest: PictureDayRequest {
        return PictureDayRequestImp(networkService: dependency.networkService)
    }
}
