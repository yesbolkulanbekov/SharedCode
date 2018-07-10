//
//  Optional+Unwrap.swift
//  MonsterTours
//
//  Created by Yesbol Kulanbekov on 5/23/18.
//  Copyright © 2018 Monster Tours. All rights reserved.
//

import Foundation

extension Optional {
    func get<T>(_ success: (Wrapped) -> T, or defaultValue: T ) -> T  {
        if let value = self {
            return success(value)
        } else {
            return defaultValue
        }
    }
}
