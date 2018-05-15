//
//  MDVTabBarItemable.swift
//  MDVTabBarController
//
//  Created by Malcolm Kumwenda on 2018/05/13.
//  Copyright © 2018 Malcolm Kumwenda. All rights reserved.
//

import UIKit

public typealias MDVTabBarContainer = UIView & MDVTabBarItemable

public protocol MDVTabBarItemable {
    func configure(withtabBarItem item: UITabBarItem)
    func setState(isSelected: Bool)
}

