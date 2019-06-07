//
//  DisplaysAlert.swift
//  MonsterTours
//
//  Created by Yesbol Kulanbekov on 6/12/18.
//  Copyright © 2018 Monster Tours. All rights reserved.
//

import UIKit

public protocol DisplaysAlert {
    func displayAlert(with message: String)
    func disPlayAlert(with message: String, action: @escaping () -> Void )
    
}

extension DisplaysAlert where Self : UIViewController {
    public func displayAlert(with message: String) {
        let alertPresenter = AlertPresenter(message: message,
                                            acceptTitle: "Ok",
                                            handler: { })
        alertPresenter.present(in: self)
        
    }
    
    public func disPlayAlert(with message: String, action: @escaping () -> Void ) {
        let alertPresenter = AlertPresenter(message: message,
                                            acceptTitle: "Ok",
                                            handler: action)
        alertPresenter.present(in: self)
    }
    
}


public struct AlertPresenter {
    
    public let message: String
    
    public let acceptTitle: String
    
    public let handler: () -> Void
    
    public func present(in viewController: UIViewController) {
        let alert = UIAlertController(
            title: nil,
            message: message,
            preferredStyle: .alert
        )
        
        let readTheMessageAction = UIAlertAction(title: acceptTitle, style: .default) { _ in
            self.handler()
        }
        
        alert.addAction(readTheMessageAction)
        
        viewController.present(alert, animated: true)
    }
}

public enum Outcome {
    case accepted
}
