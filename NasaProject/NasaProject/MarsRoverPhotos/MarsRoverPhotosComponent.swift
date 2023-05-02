import Foundation
import NeedleFoundation
import SwiftUI

protocol MarsRoverPhotosDependencies: Dependency {
    var networkService: NetworkService { get }
}

class MarsRoverPhotosComponent: Component<MarsRoverPhotosDependencies> {
    var marsRoverPhotosController: UIViewController {
        let swiftUIView = MarsRoverPhotosView(viewModel: marsRoverPhotosViewModel)
        let controller = UIHostingController(rootView: swiftUIView)
        return controller
    }
    
    private var marsRoverPhotosViewModel: MarsRoverPhotosViewModel {
        return MarsRoverPhotosViewModel(
            marsRoverPhotosLoader: marsRoverPhotosLoader
        )
    }
    
    private var marsRoverPhotosLoader: MarsRoverPhotosLoader {
        return MarsRoverPhotosLoaderImp(
            marsRoverPhotosRequest: marsRoverPhotosRequest
        )
    }
    
    private var marsRoverPhotosRequest: MarsRoverPhotosRequest {
        return MarsRoverPhotosRequestImp(
            networkService: dependency.networkService
        )
    }
}
