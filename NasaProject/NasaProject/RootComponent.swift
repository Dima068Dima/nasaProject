import Foundation
import NeedleFoundation

final class RootComponent: BootstrapComponent {
    // MARK: Dependencies
    var networkService: NetworkService {
        return NetworkServiceImp()
    }
    
    var navigationController: UINavigationController {
        shared {
            let rootViewController = UIViewController()
            rootViewController.view.backgroundColor = .white
            let navigationController = UINavigationController(rootViewController: rootViewController)
            navigationController.isNavigationBarHidden = true
            navigationController.isToolbarHidden = true
            let startingVC = self.tabBarComponent.tabBarController
            navigationController.pushViewController(
                startingVC , animated: false
            )
            return navigationController
        }
    }
    
    var alertMessenger: AlertMessenger {
        shared { AlertMessengerImp() }
    }
    
    // MARK: Components
//    var pictureDayComponent: PictureDayComponent { PictureDayComponent(parent: self) }
//    var photographsEarthComponent: PhotographsEarthComponent { PhotographsEarthComponent(parent: self) }
    var tabBarComponent: TabBarComponent { TabBarComponent(parent: self)
    }
}
