// Copyright © 2020 Jamit Labs GmbH. All rights reserved.

import UIKit

/// `TabPresenting` defines the base interface for Presenter which work on top of `UITabBarController`
public protocol TabPresenting: AnyObject {
    /// The base `UITabBarController`
    var tabBarController: UITabBarController { get }
    /// The delegate gets called to configure the presented view controller with a `UITabBarItem`
    var tabBarItemDelegate: TabBarItemDelegate? { get set }

    /// Initializes a `Presenter` with an `UITabBarController`
    /// - parameter tabBarController: the base `UITabBarController`
    init(tabBarController: UITabBarController)
}
