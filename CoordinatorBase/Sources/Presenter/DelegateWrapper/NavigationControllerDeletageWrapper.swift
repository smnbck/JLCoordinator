// Copyright © 2020 Jamit Labs GmbH. All rights reserved.

import UIKit

protocol NavigationControllerDelegate: AnyObject {
    func navigationController(_ navigationController: UINavigationController, didPop viewController: UIViewController)
    func navigationController(_ navigationController: UINavigationController, didPush viewController: UIViewController)
}

final class NavigationControllerDelegateWrapper: NSObject, UINavigationControllerDelegate {
    weak var delegate: NavigationControllerDelegate?

    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        // NOTE: UINavigationController is excluded as fromViewController since this is case if a modal presentation
        // has been triggered, starting from an UINavigationController and presenting another UINavigationController
        if
            let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from),
            !(fromViewController is UINavigationController),
            !navigationController.viewControllers.contains(fromViewController)
        {
            delegate?.navigationController(navigationController, didPop: fromViewController)
        } else if
            let toViewController = navigationController.transitionCoordinator?.viewController(forKey: .to),
            navigationController.viewControllers.contains(viewController),
            toViewController === viewController
        {
            delegate?.navigationController(navigationController, didPush: toViewController)
        }
    }
}
