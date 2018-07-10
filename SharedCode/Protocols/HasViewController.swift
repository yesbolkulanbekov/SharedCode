//
//  HasViewController.swift
//  MonsterTours
//
//  Created by Yesbol Kulanbekov on 4/10/18.
//  Copyright © 2018 Monster Tours. All rights reserved.
//

import UIKit

protocol HasViewController {
    func getVC() -> UIViewController
}

extension HasViewController {
    func getVC() -> UIViewController {
        return self as! UIViewController
    }
}

