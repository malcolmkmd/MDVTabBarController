//
//  MDVTabbableViewController.swift
//  MDVTabBarController
//
//  Created by Malcolm Kumwenda on 2018/05/13.
//  Copyright © 2018 Malcolm Kumwenda. All rights reserved.
//

import UIKit

public typealias MDVTabbableViewController = MDVTabBarViewController & UIViewController

public protocol MDVTabBarViewController {
    func mdvTabBarItem() -> UITabBarItem
}

