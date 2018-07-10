//
//  UIView+Separator.swift
//  MonsterTours
//
//  Created by Yesbol Kulanbekov on 5/9/18.
//  Copyright © 2018 Monster Tours. All rights reserved.
//

import UIKit

extension UIView {
    static func addBottomSeparator(in superView: UIView){
        let separatorOne = UIView(style: {$0.backgroundColor = UIColor.init(hexString: "BCBBC1")},Layout.falseMask)
        superView.addSubview(separatorOne)
        separatorOne.leadingAnchor.constraint(equalTo: superView.leadingAnchor).isActive = true
        separatorOne.trailingAnchor.constraint(equalTo: superView.trailingAnchor).isActive = true
        separatorOne.bottomAnchor.constraint(equalTo: superView.bottomAnchor, constant: 0).isActive = true
        separatorOne.heightAnchor.constraint(equalToConstant: 0.5 ).isActive = true
    }
}
