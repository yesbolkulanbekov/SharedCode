//
//  ButtonWithImage.swift
//  MonsterTours
//
//  Created by Yesbol Kulanbekov on 4/20/18.
//  Copyright © 2018 Monster Tours. All rights reserved.
//

import UIKit


class ButtonWithImage: UIButton {
    override func layoutSubviews() {
        super.layoutSubviews()
        if imageView != nil {
            imageEdgeInsets = UIEdgeInsetsMake(3, (titleLabel?.frame.size.width)!, 0, 0)
            titleEdgeInsets = UIEdgeInsetsMake(0, -(imageView?.frame.size.width)!, 0, 0)
            contentHorizontalAlignment = .leading
            contentVerticalAlignment   = .center
            imageView?.contentMode = .center
        }
    }
    
    var pressAction = Command.nop
    
    func addTarget(with press: Command) {
        self.pressAction = press
        addTarget(self, action: #selector(ButtonWithImage.press), for: .touchUpInside)
    }
    
    @objc func press() {
        pressAction.perform()
    }
    
    

    
}

