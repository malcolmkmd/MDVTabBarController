//
//  UnderlineAnimator.swift
//  MDVTabBarController
//
//  Created by Malcolm Kumwenda on 2018/05/13.
//  Copyright © 2018 Malcolm Kumwenda. All rights reserved.
//

import UIKit

public class MDVUnderlineAnimator: MDVTabBarAnimatable {
    
    private let underlineColor: UIColor
    private let underlineHeight: CGFloat
    private let underlineWidth: CGFloat
    private let underlineOffsetY: CGFloat
    private var underlineView: UIView = UIView(frame: .zero)
    
    private let duration: Double
    private let delay: Double
    private let damping: CGFloat
    private let velocity: CGFloat
    
    
    public init(withUnderlineColor underlineColor: UIColor,
         underlineHeight: CGFloat,
         underlineWidth: CGFloat,
         underlineOffsetY: CGFloat,
         duration: Double,
         delay: Double,
         damping: CGFloat,
         velocity: CGFloat){
        self.underlineColor = underlineColor
        self.underlineHeight = underlineHeight
        self.underlineWidth = underlineWidth
        self.underlineOffsetY = underlineOffsetY
        self.damping = damping
        self.duration = duration
        self.delay = delay
        self.velocity = velocity
    }
    
    public func prepareForAnimation(onMDVTabBar tabBar: UIView, withContainers containers: [MDVTabBarContainer], andInitialIndex initialIndex: Int) {
        let xPosition = CGFloat(containers[initialIndex].frame.midX) - (self.underlineWidth/2)
        let yPosition = CGFloat(containers[initialIndex].frame.midY) + self.underlineOffsetY
        self.underlineView = UIView(frame: CGRect(x: xPosition,
                                                  y: yPosition,
                                                  width: self.underlineWidth,
                                                  height: self.underlineHeight))
        self.underlineView.backgroundColor = self.underlineColor
        self.underlineView.layer.cornerRadius = 1
        tabBar.insertSubview(self.underlineView, at: 0)
    }
    
    public func performAnimation(fromIndex: Int,
                          toIndex: Int,
                          onMDVTabBar tabBar: UIView,
                          withContainers containers: [MDVTabBarContainer],
                          completion: @escaping () -> Void) {
        
        UIView.animate(withDuration: duration,
                       delay: delay,
                       usingSpringWithDamping: damping,
                       initialSpringVelocity: velocity,
                       options: .curveLinear,
                       animations: {
                        let xPosition = CGFloat(containers[toIndex].frame.midX) - (self.underlineWidth/2)
                        let yPosition = CGFloat(containers[toIndex].frame.midY) + self.underlineOffsetY
                        self.underlineView.frame = CGRect(x: xPosition,
                                                          y: yPosition,
                                                          width: self.underlineWidth,
                                                          height: self.underlineHeight)
                        completion()
        })
    }
}

