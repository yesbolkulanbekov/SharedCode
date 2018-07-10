//
//  DisplaysAlert.swift
//  MonsterTours
//
//  Created by Yesbol Kulanbekov on 6/12/18.
//  Copyright © 2018 Monster Tours. All rights reserved.
//

import UIKit

protocol DisplaysAlert {
    func displayAlert(with message: String)
    func disPlayAlert(with message: String, action: @escaping (UIAlertAction) -> Void )

}

extension DisplaysAlert {
    func displayAlert(with message: String) {
        Alerts.defaultMessageOK(message, vc: self as! UIViewController)
    }
    
    func disPlayAlert(with message: String, action: @escaping (UIAlertAction) -> Void ) {
        Alerts.customOneAction("", message: message,
                               action: "Перейти на главный эран",
                               handler: action,
                               vc: self as! UIViewController)
    }

}
