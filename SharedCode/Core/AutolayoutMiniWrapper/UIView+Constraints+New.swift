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

public enum YEdge {
  case top
  case bottom
  case verticalCenter
  case firstBaseline
  case lastBaseline
  
  var keyPath: KeyPath<UIView, NSLayoutYAxisAnchor> {
    switch self {
    case .top:
      return \UIView.topAnchor
    case .bottom:
      return \UIView.bottomAnchor
    case .verticalCenter:
      return \UIView.centerYAnchor
    case .firstBaseline:
      return \UIView.firstBaselineAnchor
    case .lastBaseline:
      return \UIView.lastBaselineAnchor
    }
  }
}

public enum XEdge {

  case leading
  case trailing
  case horizontalCenter
  
  var keyPath: KeyPath<UIView, NSLayoutXAxisAnchor> {
    switch self {
    case .leading:
      return \UIView.leadingAnchor
    case .trailing:
      return \UIView.trailingAnchor
    case .horizontalCenter:
      return \UIView.centerXAnchor
    }
  }
  
}

// MARK: Factory methods over the NSLayoutAnchor<AnchorType> methods
// Create constraints for X and Y anchors

/// Describes relation between X anchors of two views
/// Example: 'make(my: .leading, .equal, to: .trailing, of: view, plus: 30)'
public func make(
  my xEdge: XEdge,
  _ relation: NSLayoutConstraint.Relation,
  to viewsXEdge : XEdge,
  of view: UIView,
  plus c: CGFloat = 0
) -> Constraint {
  return  { layoutView in
    let anc = layoutView[keyPath: xEdge.keyPath]
    let vAnc = view[keyPath: viewsXEdge.keyPath]
    switch relation {
    case .equal:
      return anc.constraint(equalTo: vAnc, constant: c)
    case .greaterThanOrEqual:
      return anc.constraint(greaterThanOrEqualTo: vAnc, constant: c)
    case .lessThanOrEqual:
      return anc.constraint(lessThanOrEqualTo: vAnc, constant: c)
    }
  }
}

/// Describes relation between X anchors of two views
/// Example: 'pin(my: .leading, to: .trailing, of: view, plus: 40)'
public func pin(
  my xEdge: XEdge,
  to viewsXEdge : XEdge,
  of view: UIView,
  plus c: CGFloat = 0
) -> Constraint {
  return make(my: xEdge, .equal, to: viewsXEdge, of: view, plus: c)
}

/// Describes relation between X anchors of two views
/// Example: 'pin(my: .leading, andOf: view, plus: 16)'
public func pin(
  my xEdge: XEdge,
  andOf view: UIView,
  plus c: CGFloat = 0
) -> Constraint {
  return pin(my: xEdge, to: xEdge, of: view, plus: c)
}

/// Describes relation between Y anchors of two views
/// Example: 'make(my: .bottom, .equal, to: .top, of: view, plus: 40)'
public func make(
  my yEdge: YEdge,
  _ relation: NSLayoutConstraint.Relation,
  to viewsYEdge : YEdge,
  of view: UIView,
  plus c: CGFloat = 0
) -> Constraint {
  return  { layoutView in
    let anc = layoutView[keyPath: yEdge.keyPath]
    let vAnc = view[keyPath: viewsYEdge.keyPath]
    switch relation {
    case .equal:
      return anc.constraint(equalTo: vAnc, constant: c)
    case .greaterThanOrEqual:
      return anc.constraint(greaterThanOrEqualTo: vAnc, constant: c)
    case .lessThanOrEqual:
      return anc.constraint(lessThanOrEqualTo: vAnc, constant: c)
    }
  }
}

/// Describes relation between Y anchors of two views
/// Example: 'pin(my: .top, to: .bottom, of: view, plus: 40)'
public func pin(
  my yEdge: YEdge,
  to viewsYEdge : YEdge,
  of view: UIView,
  plus c: CGFloat = 0
) -> Constraint {
  return make(my: yEdge, .equal, to: viewsYEdge, of: view, plus: c)
}

/// Describes relation between Y anchors of two views
/// Example: 'pin(my: .top, andOf: view, plus: 16)'
public func pin(
  my yEdge: YEdge,
  andOf view: UIView,
  plus c: CGFloat = 0
  ) -> Constraint {
  return pin(my: yEdge, to: yEdge, of: view, plus: c)
}





// MARK: Factory methods over the NSLayoutDimension methods
// Create constraints for width and height


/// Describes relation between dimension of two views
/// Example: 'make(my: .height, .greaterThanOrEqual, to: .width, of: view, times: 2, plus: 3)'
public func make(
  my dimension: Dimensions,
  _ relation: NSLayoutConstraint.Relation ,
  to viewsDimension : Dimensions,
  of view: UIView,times x: CGFloat = 1,
  plus c: CGFloat = 0
) -> Constraint {
  return  { layoutView in
    let anc = layoutView[keyPath: dimension.keyPath]
    let vAnc = view[keyPath: viewsDimension.keyPath]
    switch relation {
    case .equal:
      return anc.constraint(equalTo: vAnc, multiplier: x, constant: c)
    case .greaterThanOrEqual:
      return anc.constraint(greaterThanOrEqualTo: vAnc, multiplier: x, constant: c)
    case .lessThanOrEqual:
      return anc.constraint(lessThanOrEqualTo: vAnc, multiplier: x, constant: c)
    }
  }
}

/// Describes relation between dimension of two views
/// Example: 'align(my: .height, and: .width, of: view, times: 2, plus: 3)'
public func align(
  my dimension: Dimensions,
  and viewsDimension : Dimensions,
  of view: UIView,
  times x: CGFloat = 1,
  plus c: CGFloat = 0
) -> Constraint {
  return make(my: dimension, .equal, to: viewsDimension, of: view, times: x, plus: c)
}

/// Describes constraint that will be equal to greater or less than a constant
/// Examples: 'set(my: .height, to: 22)'
/// 'set(my: .height, .greaterThanOrEqual, to: 23)'
/// 'set(my: .height, .lessThanOrEqual, to: 23)'
public func set(my dimension: Dimensions,
                _ relation: NSLayoutConstraint.Relation = .equal, to constant: CGFloat)
-> Constraint {
  return { layoutView in
    let anchor = layoutView[keyPath: dimension.keyPath]
    switch relation {
    case .equal:
      return anchor.constraint(equalToConstant: constant)
    case .greaterThanOrEqual:
      return anchor.constraint(greaterThanOrEqualToConstant: constant)
    case .lessThanOrEqual:
      return anchor.constraint(lessThanOrEqualToConstant: constant)
    }
  }
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

/// Pin view to its superview's safe area
public func pinToSuperSafeArea(with insets: UIEdgeInsets = UIEdgeInsets(all: 0)) -> [Constraint] {
  return [
    { $0.topAnchor.constraint(equalTo: $0.superview!.safeLayoutGuide.topAnchor, constant: insets.top )},
    { $0.bottomAnchor.constraint(equalTo: $0.superview!.safeLayoutGuide.bottomAnchor, constant: -insets.bottom )},
    { $0.leadingAnchor.constraint(equalTo: $0.superview!.safeLayoutGuide.leadingAnchor, constant: insets.left )},
    { $0.trailingAnchor.constraint(equalTo: $0.superview!.safeLayoutGuide.trailingAnchor, constant: -insets.right )}
  ]
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
