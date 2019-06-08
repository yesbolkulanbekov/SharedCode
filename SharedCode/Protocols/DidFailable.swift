//
//  DidFailable.swift
//  MonsterTours
//
//  Created by Yesbol Kulanbekov on 6/13/18.
//  Copyright © 2018 Monster Tours. All rights reserved.
//

import Foundation

public protocol Failable {
    func didFail(with error: Error)
}


protocol DidSucceedAble {
    func didSucceed(with message: String)
}
