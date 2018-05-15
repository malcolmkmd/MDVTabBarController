//
//  MDVTabBar.swift
//  MDVTabBarController
//
//  Created by Malcolm Kumwenda on 2018/05/13.
//  Copyright © 2018 Malcolm Kumwenda. All rights reserved.
//
import UIKit

class MDVTabBar: UIView {
    
    //MARK:- Public Properties
    weak var mdvTabBarDelegate: MDVTabBarDelegate? {
        didSet {
            self.changeIconState(forIndex: self.initialIndex, isInitial: true)
        }
    }
    weak var mdvTabBarDataSource: MDVTabBarDataSource? {
        didSet {
            self.configure()
        }
    }
    
    //MARK:- Private Properties
    private(set) var tabBarItems = [UITabBarItem]()
    private(set) var selectedIndex: Int
    private(set) var initialIndex: Int
    private(set) var animator: MDVTabBarAnimatable!
    private var tabBarItemContainers = [UIView]()
    private var animatedTabBarItems = [MDVTabBarContainer]()
    
    //MARK:- Initialiser
    init(withInitialIndex initialIndex: Int,
         backgroundColor: UIColor) {
        self.initialIndex = initialIndex
        self.selectedIndex = initialIndex
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:- Private Methods
    private func configure() {
        guard let dataSource = mdvTabBarDataSource else {
            return
        }
        
        animator = dataSource.mdvTabBarAnimator()
        tabBarItems = dataSource.mdvTabBarItems()
        
        let containerRects = createContainerRects()
        createTabBarItems(usingContainerRects: containerRects)
        
        animator.prepareForAnimation(onMDVTabBar: self,
                                     withContainers: animatedTabBarItems,
                                     andInitialIndex: initialIndex)
    }
    
    private func createContainerRects() -> [CGRect] {
        var rects = [CGRect]()
        for index in 0..<tabBarItems.count {
            let containerRect = createTabBarItemContainerRect(atIndex: index)
            rects.append(containerRect)
        }
        return rects
    }
    
    private func createTabBarItemContainerRect(atIndex index: Int) -> CGRect {
        let containerWidth = frame.width / CGFloat(tabBarItems.count)
        let containerHeight = frame.height
        let containerRect = CGRect(x: CGFloat(index)*containerWidth,
                                   y: 0,
                                   width: containerWidth,
                                   height: containerHeight)
        
        return containerRect
    }
    
    private func createTabBarItems(usingContainerRects rects: [CGRect]) {
        for index in 0..<tabBarItems.count {
            
            let containerRect = rects[index]
            
            let animatedTabBarItem = MDVTabBarItem(frame: containerRect)
            animatedTabBarItem.configure(withtabBarItem: tabBarItems[index])
            animatedTabBarItems.append(animatedTabBarItem)
            
            let tabBarButton = UIButton(frame: containerRect)
            tabBarButton.tag = index
            tabBarButton.addTarget(self,
                                   action: #selector(self.touchUpInsideForTabBarButton(sender:)),
                                   for: .touchUpInside)
            
            self.addSubview(tabBarButton)
            self.addSubview(animatedTabBarItem)
            self.bringSubview(toFront: animatedTabBarItem)
            self.bringSubview(toFront: tabBarButton)
        }
    }
    
    @objc private func touchUpInsideForTabBarButton(sender: UIButton) {
        animator.performAnimation(fromIndex: selectedIndex,
                                  toIndex: sender.tag,
                                  onMDVTabBar: self,
                                  withContainers: animatedTabBarItems) {
                                    guard self.selectedIndex != sender.tag else { return }
                                    self.changeIconState(forIndex: sender.tag, isInitial: false)
        }
    }
    
    private func changeIconState(forIndex index: Int, isInitial: Bool) {
        self.animatedTabBarItems[index].setState(isSelected: true)
        if !isInitial {
            self.animatedTabBarItems[self.selectedIndex].setState(isSelected: false)
        }
        self.selectedIndex = index
        self.mdvTabBarDelegate?.didSelect(tabAtIndex: index)
    }
}
