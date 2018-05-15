//
//  MDVTabBarAnimatable.swift
//  MDVTabBarController
//
//  Created by Malcolm Kumwenda on 2018/05/13.
//  Copyright © 2018 Malcolm Kumwenda. All rights reserved.
//

import UIKit

public protocol MDVTabBarAnimatable {
    func prepareForAnimation(onMDVTabBar tabBar: UIView,
                             withContainers containers: [MDVTabBarContainer],
                             andInitialIndex initialIndex:Int)
    func performAnimation(fromIndex:Int,
                          toIndex:Int,
                          onMDVTabBar tabBar: UIView,
                          withContainers containers: [MDVTabBarContainer],
                          completion: @escaping () -> Void)
}

