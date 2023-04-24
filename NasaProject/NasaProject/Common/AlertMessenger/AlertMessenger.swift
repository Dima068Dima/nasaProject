import Foundation

import UIKit

typealias AlertMessage = String
typealias AlertTitle = String

protocol AlertMessenger {
    func presentAlert(title: AlertTitle, message: AlertMessage)
}

final class AlertMessengerImp: AlertMessenger {
    func presentAlert(title: AlertTitle, message: AlertMessage) {
        let alert = createAlert(with: message, with: title)
        let presentingVC = getPresentingVC()
        presentingVC?.present(alert, animated: true)
    }

    private func createAlert(with message: AlertMessage, with title: AlertTitle) -> UIAlertController {
        let alertVC =  UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )

        let dismissButton = UIAlertAction(title: "Ok", style: .cancel)
        alertVC.addAction(dismissButton)

        return alertVC
    }

    private func getPresentingVC() -> UIViewController? {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let sceneDelegate = windowScene.delegate as? SceneDelegate
        else {
            return nil
        }

        return sceneDelegate.window?.rootViewController
    }
}

