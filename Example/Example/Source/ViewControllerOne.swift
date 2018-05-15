//
//  ViewControllerOne.swift
//  ExampleMDVTabBarController
//
//  Created by Malcolm Kumwenda on 2018/05/15.
//  Copyright © 2018 Malcolm Kumwenda. All rights reserved.
//

import MDVTabBarController
import SwiftIcons

class ViewControllerOne: MDVTabbableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white 
    }
    
    func mdvTabBarItem() -> UITabBarItem {
        let item = UITabBarItem()
        item.selectedImage = UIImage(icon: .dripicon(.home),
                                     size: CGSize(width: 25, height: 25),
                                     textColor: .white)
        item.image = UIImage(icon: .dripicon(.home),
                             size: CGSize(width: 25, height: 25),
                             textColor: UIColor(named: "Standard")!)
        return item
    }
}
