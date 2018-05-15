//
//  MDVTabBarControllerDataSource+Delegate.swift
//  MDVTabBarController
//
//  Created by Malcolm Kumwenda on 2018/05/13.
//  Copyright © 2018 Malcolm Kumwenda. All rights reserved.
//

import UIKit

public protocol MDVTabBarControllerDataSource: class {
    func tabBarControllerInitialIndex() -> Int
    func tabBarControllerViewControllers() -> [MDVTabbableViewController]
    func tabBarHeight() -> CGFloat
    func tabBarBackgroundColor() -> UIColor
    func tabBarAnimator() -> MDVTabBarAnimatable
}

public protocol MDVTabBarControllerDelegate: class {
    func tabBar(_ tabBarController: MDVTabBarController, didSelectIndex index: Int)
}
