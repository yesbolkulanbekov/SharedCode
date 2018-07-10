//
//  UIStackView+createBorder.swift
//  MonsterTours
//
//  Created by Yesbol Kulanbekov on 4/18/18.
//  Copyright © 2018 Monster Tours. All rights reserved.
//

import UIKit

extension UIView {
    
    func createBorder() {
        let left = UIView(style: {$0.backgroundColor = .red}, Layout.falseMask)
        self.addSubview(left)
        left.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        left.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        left.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        left.widthAnchor.constraint(equalToConstant: 1.5).isActive = true
        
        let right = UIView(style: {$0.backgroundColor = .red}, Layout.falseMask)
        self.addSubview(right)
        right.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        right.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        right.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        right.widthAnchor.constraint(equalToConstant: 1.5).isActive = true
        
        let bottom = UIView(style: {$0.backgroundColor = .red}, Layout.falseMask)
        self.addSubview(bottom)
        bottom.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        bottom.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        bottom.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        bottom.heightAnchor.constraint(equalToConstant: 1.5 ).isActive = true
        
        let top = UIView(style: {$0.backgroundColor = .red}, Layout.falseMask)
        self.addSubview(top)
        top.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        top.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        top.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        top.heightAnchor.constraint(equalToConstant: 1.5).isActive = true
    }
}


