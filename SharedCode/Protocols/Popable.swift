//
//  Popable.swift
//  MonsterTours
//
//  Created by Yesbol Kulanbekov on 6/13/18.
//  Copyright © 2018 Monster Tours. All rights reserved.
//

import UIKit

protocol Popable {
    func pop(topOf vc: UIViewController)
}


extension Popable {
    func pop(topOf vc: UIViewController) {
        vc.navigationController?.popViewController(animated: true)
    }
}
