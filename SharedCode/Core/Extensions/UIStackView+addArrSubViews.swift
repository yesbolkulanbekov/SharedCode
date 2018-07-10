//
//  UIStackView+addArrSubViews.swift
//  MonsterTours
//
//  Created by Yesbol Kulanbekov on 4/28/18.
//  Copyright © 2018 Monster Tours. All rights reserved.
//

import UIKit

extension UIStackView {
    public func addArrangedSubviews(_ subViews: [UIView]) {
        subViews.forEach { self.addArrangedSubview($0) }
    }
}

