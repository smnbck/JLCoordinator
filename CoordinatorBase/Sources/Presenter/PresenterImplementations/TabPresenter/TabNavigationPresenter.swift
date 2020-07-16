// Copyright © 2020 Jamit Labs GmbH. All rights reserved.

import UIKit

public final class TabNavigationPresenter: NavigationPresenter, TabPresenting {
    public let tabBarController: UITabBarController

    public init(tabBarController: UITabBarController) {
        self.tabBarController = tabBarController

        super.init(navigationController: .init())
    }

    override public func present(_ viewController: UIViewController, animated: Bool = true) {
        guard
            let navigationController = navigationController,
            tabBarController.viewControllers?.contains(navigationController) != true
        else {
            return super.present(viewController, animated: animated)
        }

        navigationController.pushViewController(viewController, animated: animated)
        navigationController.tabBarItem = viewController.tabBarItem
        presentOnTab(navigationController, animated: animated)
    }

    override public func dismiss(_ viewController: UIViewController, animated: Bool = true) {
        guard
            let navigationController = navigationController,
            viewController === navigationController.viewControllers.first,
            tabBarController.viewControllers?.contains(navigationController) == true
        else {
            return super.dismiss(viewController, animated: animated)
        }
    }
}
