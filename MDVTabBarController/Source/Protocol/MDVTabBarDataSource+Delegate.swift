//
//  MDVTabBarDataSource+Delegate.swift
//  MDVTabBarController
//
//  Created by Malcolm Kumwenda on 2018/05/13.
//  Copyright © 2018 Malcolm Kumwenda. All rights reserved.
//

import UIKit

protocol MDVTabBarDelegate: class {
    func didSelect(tabAtIndex index: Int)
}

protocol MDVTabBarDataSource: class {
    func mdvTabBarItems() -> [UITabBarItem]
    func mdvTabBarAnimator() -> MDVTabBarAnimatable?
}
