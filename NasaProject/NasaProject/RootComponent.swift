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
            let startingVC = self.pictureDayComponent.pictureDayController
            navigationController.pushViewController(
                startingVC , animated: false
            )
            return navigationController
        }
    }
    
    // MARK: Components
    var pictureDayComponent: PictureDayComponent { PictureDayComponent(parent: self) }
}