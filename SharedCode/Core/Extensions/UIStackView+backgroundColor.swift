//
//  UIStackView+backgroundColor.swift
//  MonsterTours
//
//  Created by Yesbol Kulanbekov on 5/23/18.
//  Copyright © 2018 Monster Tours. All rights reserved.
//

import UIKit

extension UIStackView {
    override open var backgroundColor: UIColor? {
        get {
            return super.backgroundColor
        }
        set {
            let subView = UIView()
            subView.backgroundColor = newValue
            subView.translatesAutoresizingMaskIntoConstraints = false
            self.insertSubview(subView, at: 0)
            subView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
            subView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
            subView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
            subView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        }
    }
}

