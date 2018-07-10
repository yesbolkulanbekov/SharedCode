//
//  UIViewLayout.swift
//  InvestCRM
//
//  Created by Yesbol Kulanbekov on 5/18/18.
//  Copyright © 2018 zed.kz. All rights reserved.
//

import UIKit

protocol UIViewLayout {
    associatedtype MainViewType
    associatedtype ContentType
    var mainView: MainViewType { get set }
    var contents: ContentType  { get set }
    func paint()
    func addSubViews()
    func addConstraints()
}

extension UIViewLayout {
    func paint() {
        addSubViews()
        addConstraints()
    }
}
