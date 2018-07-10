//
//  UIEdgeInsets+Inits.swift
//  MonsterTours
//
//  Created by Yesbol Kulanbekov on 5/23/18.
//  Copyright © 2018 Monster Tours. All rights reserved.
//

import UIKit

public typealias Insets = UIEdgeInsets

extension UIEdgeInsets {
    public init(all: CGFloat) {
        self = UIEdgeInsets(top: all, left: all, bottom: all, right: all)
    }
    
    public init(ver: CGFloat = 0, hor: CGFloat = 0) {
        self = UIEdgeInsets(top: ver, left: hor, bottom: ver, right: hor)
    }
}
