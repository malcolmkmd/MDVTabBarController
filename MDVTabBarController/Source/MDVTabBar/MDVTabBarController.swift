//
//  MDVTabBarController.swift
//  MDVTabBarController
//
//  Created by Malcolm Kumwenda on 2018/05/13.
//  Copyright © 2018 Malcolm Kumwenda. All rights reserved.
//
import UIKit

open class MDVTabBarController: UITabBarController {
    
    //MARK:- Properties
    public weak var mdvTabBarControllerDataSource: MDVTabBarControllerDataSource? {
        didSet {
            self.configureViews()
        }
    }
    public var mdvTabBarControllerDelegate : MDVTabBarControllerDelegate?
    private var mdvTabBar: MDVTabBar!
    
    //MARK:- Initialiser
    public init(){
        super.init(nibName: nil, bundle: nil)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("")
    }
    
    
    //MARK:- Private Methods
    private func configureViews() {
        guard let dataSource = self.mdvTabBarControllerDataSource else { return }
        tabBar.isHidden = true
        viewControllers = dataSource.tabBarControllerViewControllers()
        mdvTabBar = MDVTabBar(withInitialIndex: dataSource.tabBarControllerInitialIndex(),
                              backgroundColor: dataSource.tabBarBackgroundColor())
        view.addSubview(mdvTabBar)
        setupUITabBarConstraints(withHeightOf: dataSource.tabBarHeight())
        mdvTabBar.mdvTabBarDataSource = self
        mdvTabBar.mdvTabBarDelegate = self
        
        
    }
    
    private func setupUITabBarConstraints(withHeightOf height: CGFloat) {
        mdvTabBar.translatesAutoresizingMaskIntoConstraints = false
        mdvTabBar.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mdvTabBar.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        if #available(iOS 11.0, *) {
            mdvTabBar.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
            let bottomView = UIView(frame: .zero)
            bottomView.backgroundColor = mdvTabBar.backgroundColor
            view.addSubview(bottomView)
            bottomView.translatesAutoresizingMaskIntoConstraints = false
            bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            bottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
            bottomView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        } else {
            mdvTabBar.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        }
        
        mdvTabBar.heightAnchor.constraint(equalToConstant: height).isActive = true
        self.view.layoutIfNeeded()
    }
}

extension MDVTabBarController: MDVTabBarDelegate, MDVTabBarDataSource {
    func didSelect(tabAtIndex index: Int) {
        self.selectedIndex = index
    }
    
    
    func mdvTabBarAnimator() -> MDVTabBarAnimatable? {
        guard let dataSource = mdvTabBarControllerDataSource else { fatalError() }
        return dataSource.tabBarAnimator()
    }
    
    func mdvTabBarItems() -> [UITabBarItem] {
        guard let dataSource = mdvTabBarControllerDataSource else { fatalError() }
        return dataSource.tabBarControllerViewControllers().map({ $0.mdvTabBarItem() })
    }
}
