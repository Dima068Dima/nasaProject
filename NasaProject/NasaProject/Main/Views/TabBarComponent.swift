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
            pictureDayViewModel: pictureDayViewModel,
            marsRoverPhotosViewModel: marsRoverPhotosViewModel,
            photoSelectMarsDateViewModel: photoSelectMarsDateViewModel
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
    
    private var photoSelectMarsDateViewModel: PhotoSelectMarsDateViewModel {
        return PhotoSelectMarsDateViewModel(
            photoSelectMarsDateLoader: photoSelectMarsDateLoader
        )
    }
    
    private var photoSelectMarsDateLoader: PhotoSelectMarsDateLoader {
        return PhotoSelectMarsDateLoaderImp(
            photoSelectMarsDateRequest: photoSelectMarsDateRequest
        )
    }
    
    private var photoSelectMarsDateRequest: PhotoSelectMarsDateRequest {
        return PhotoSelectOfMarsByDateRequest(
            networkService: dependency.networkService
        )
    }
}
