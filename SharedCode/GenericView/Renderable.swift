//
//  Renderable.swift
//  MonsterTours
//
//  Created by Yesbol Kulanbekov on 5/23/18.
//  Copyright © 2018 Monster Tours. All rights reserved.
//

import Foundation

public protocol Renderable {
    associatedtype Properties
    func render(with props: Properties)
    func layout()
}
