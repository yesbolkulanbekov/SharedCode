//
//  UIView+Constraints+New.swift
//  SharedCode
//
//  Created by Yesbol Kulanbekov on 6/16/19.
//  Copyright © 2019 Lobster. All rights reserved.
//

import UIKit

// MARK: Helper types for factory methods

public enum Dimensions {
  case width
  case height
  
  var keyPath: KeyPath<UIView, NSLayoutDimension> {
    switch self {
    case .width:
      return \UIView.widthAnchor
    case .height:
      return \UIView.heightAnchor
    }
  }
}

// MARK: Factory methods over the NSLayoutDimension methods
// Create constraints for width and height

/// Describes relation between dimension of two views
/// Example: 'align(my: .height, and: .width, of: view, times: 2, plus: 3)'
public func align(
  my dimension: Dimensions, and viewsDimension : Dimensions,
  of view: UIView,times multiplier: CGFloat = 1,
  plus constant: CGFloat = 0
) -> Constraint {
  return  { layoutView in
    layoutView[keyPath: dimension.keyPath].constraint(
      equalTo: view[keyPath: viewsDimension.keyPath],
      multiplier: multiplier,
      constant: constant
    )
  }
}

/// Describes constraint that will be equal to greater or less than a constant
/// Examples: 'set(my: .height, to: 22)'
/// 'set(my: .height, .greaterThanOrEqual, to: 23)'
/// 'set(my: .height, .lessThanOrEqual, to: 23)'
public func set(my dimension: Dimensions,
                _ relation: NSLayoutConstraint.Relation = .equal, to constant: CGFloat)
-> Constraint {
  return { layoutView in
    layoutView[keyPath: dimension.keyPath].constraint(equalToConstant: constant)
  }
}



// MARK: Old prototypes


/// Example: `align(my: \.widthAnchor, with: \.heightAnchor, of: view)`
public func alignOld<Anchor>(my from: KeyPath<UIView, Anchor>,
                          with to : KeyPath<UIView, Anchor>,
                          of view: UIView,
                          multBy multiplier: CGFloat = 1,
                          plus constant: CGFloat = 0) -> Constraint where Anchor: NSLayoutDimension
{
    let constraint: Constraint =  { layoutView in
        let myAnchor = layoutView[keyPath: from]
        let otherViewAnchor = view[keyPath: to]
        let constraint: NSLayoutConstraint = myAnchor.constraint(
            equalTo: otherViewAnchor,
            multiplier: multiplier,
            constant: constant
        )
    
        return constraint
    }
    
    return constraint
}


/// Pin view to its superview
public func pinToSuper(with insets: UIEdgeInsets = UIEdgeInsets(all: 0)) -> [Constraint] {
    return [
        { $0.topAnchor.constraint(equalTo: $0.superview!.topAnchor, constant: insets.top )},
        { $0.bottomAnchor.constraint(equalTo: $0.superview!.bottomAnchor, constant: -insets.bottom )},
        { $0.leadingAnchor.constraint(equalTo: $0.superview!.leadingAnchor, constant: insets.left )},
        { $0.trailingAnchor.constraint(equalTo: $0.superview!.trailingAnchor, constant: -insets.right )}
    ]
}












// MARK: Support Types

public struct Dims {
    public static let width = \UIView.widthAnchor
    public static let height = \UIView.heightAnchor
}

public struct Ancs {
    public static let top = \UIView.topAnchor
    public static let bottom = \UIView.bottomAnchor
    public static let leading = \UIView.leadingAnchor
    public static let trailing = \UIView.trailingAnchor
    public static let verticalCenter = \UIView.centerXAnchor
    public static let horizontalCenter = \UIView.centerYAnchor
    
    public static let firstBaseline = \UIView.firstBaselineAnchor
    public static let lastBaseline = \UIView.lastBaselineAnchor
}

extension UIView {
    var safeLayoutGuide: UILayoutGuide {
        if #available(iOS 11, *) {
            return safeAreaLayoutGuide
        } else {
            return layoutMarginsGuide
        }
    }
}
