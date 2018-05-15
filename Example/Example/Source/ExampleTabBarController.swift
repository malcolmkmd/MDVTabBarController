//
//  ExampleTabBarController.swift
//  ExampleMDVTabBarController
//
//  Created by Malcolm Kumwenda on 2018/05/15.
//  Copyright © 2018 Malcolm Kumwenda. All rights reserved.
//

import MDVTabBarController

class ExampleTabBarController: MDVTabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        mdvTabBarControllerDataSource = self
        mdvTabBarControllerDelegate = self
    }
}

extension ExampleTabBarController: MDVTabBarControllerDelegate {
    func tabBar(_ tabBarController: MDVTabBarController, didSelectIndex index: Int) {
        
    }
}


extension ExampleTabBarController: MDVTabBarControllerDataSource {
    func tabBarControllerInitialIndex() -> Int {
        return 3
    }
    
    func tabBarControllerViewControllers() -> [MDVTabbableViewController] {
        return [ViewControllerOne(),
        ViewControllerTwo(),
        ViewControllerThree(),
        ViewControllerFour()]
    }
    
    func tabBarHeight() -> CGFloat {
        return 40
    }
    
    func tabBarBackgroundColor() -> UIColor {
        return .white
    }
    
    func tabBarAnimator() -> MDVTabBarAnimatable {
        return MDVSlidingOverlayAnimator(withTabBarColors: [UIColor(named: "One")!,
                                                            UIColor(named: "Two")!,
                                                            UIColor(named: "Three")!,
                                                            UIColor(named: "Four")!])
    }
}
