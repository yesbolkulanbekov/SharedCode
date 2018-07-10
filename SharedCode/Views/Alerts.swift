//
//  Alerts.swift
//  MonsterTours
//
//  Created by Yesbol Kulanbekov on 6/12/18.
//  Copyright © 2018 Monster Tours. All rights reserved.
//

import Foundation
import UIKit

class Alerts {
    
    static func defaultMessageOK (_ message: String, vc: UIViewController) {
        customOneAction("", message: message, action: "OK", handler: nil, vc: vc)
    }
    
    static func MessageOKPopBackOnOK (_ message: String, vc: UIViewController) {
        customOneAction("", message: message, action: "OK", handler: {(UIAlertAction) -> Void in
            _ = vc.navigationController?.popViewController(animated: true)
        }, vc: vc)
    }
    
    static func customOneAction (_ title : String, message : String, action : String, handler: ((UIAlertAction) -> Void)?, vc: UIViewController){
        let alertCT = UIAlertController (title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alertCT.addAction(UIAlertAction(title: action, style: UIAlertActionStyle.default, handler: handler))
        vc.present(alertCT, animated: true, completion: nil)
    }
    
    static func customTwoActions (_ title : String, message : String, actionOne : String, handlerOne: ((UIAlertAction) -> Void)?, actionTwo:String, handlerTwo: ((UIAlertAction) -> Void)?, vc: UIViewController){
        let alertCT = UIAlertController (title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alertCT.addAction(UIAlertAction(title: actionOne, style: UIAlertActionStyle.default, handler: handlerOne))
        alertCT.addAction(UIAlertAction(title: actionTwo, style: UIAlertActionStyle.default, handler: handlerTwo))
        vc.present(alertCT, animated: true, completion: nil)
    }
    
}

