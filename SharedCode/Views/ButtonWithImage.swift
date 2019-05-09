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
            imageEdgeInsets = UIEdgeInsets(top: 3, left: (titleLabel?.frame.size.width)!, bottom: 0, right: 0)
            titleEdgeInsets = UIEdgeInsets(top: 0, left: -(imageView?.frame.size.width)!, bottom: 0, right: 0)
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

