import Foundation
import NeedleFoundation
import SwiftUI

protocol PhotographsEarthDependencies: Dependency {
    var networkService: NetworkService { get }
}

class PhotographsEarthComponent: Component<PhotographsEarthDependencies> {
    var photographsEarthController: UIViewController {
        let swiftUIView = PhotographsEarthView(viewModel: viewModel)
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
}
