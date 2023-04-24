import Foundation
import NeedleFoundation
import SwiftUI

protocol TabBarDependencies: Dependency {
    var networkService: NetworkService { get }
}

class TabBarComponent: Component<TabBarDependencies> {
    var tabBarController: UIViewController {
        let swiftUIView = TabBarView(viewModel: viewModel)
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
