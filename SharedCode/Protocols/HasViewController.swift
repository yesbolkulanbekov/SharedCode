//
//  HasViewController.swift
//  MonsterTours
//
//  Created by Yesbol Kulanbekov on 4/10/18.
//  Copyright © 2018 Monster Tours. All rights reserved.
//

import UIKit

public protocol HasViewController {
    func getVC() -> UIViewController
}

extension HasViewController {
    public func getVC() -> UIViewController {
        return self as! UIViewController
    }
}

