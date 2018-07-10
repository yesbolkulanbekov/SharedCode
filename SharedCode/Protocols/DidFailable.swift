//
//  DidFailable.swift
//  MonsterTours
//
//  Created by Yesbol Kulanbekov on 6/13/18.
//  Copyright © 2018 Monster Tours. All rights reserved.
//

import Foundation

protocol DidFailable {
    func didFail(with errorMessage: String)
}


protocol DidSucceedAble {
    func didSucceed(with message: String)
}
