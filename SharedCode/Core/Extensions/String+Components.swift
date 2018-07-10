//
//  String+Components.swift
//  MonsterTours
//
//  Created by Yesbol Kulanbekov on 6/19/18.
//  Copyright © 2018 Monster Tours. All rights reserved.
//


extension String {
    func beforeDot() -> String{
        let components = self.split{$0 == "."}.map ( String.init )
        guard components.count != 0  else { return self }
        guard !components[0].isEmpty else { return self }
        return components[0]
    }
}


