//
//  AutolayoutWrapper.swift
//  IndoorNavigation
//
//  Created by Yesbol Kulanbekov on 2/5/19.
//  Copyright © 2019 zed.kz. All rights reserved.
//

import Foundation

//
//  UIView+Constraints.swift
//  CiLabs
//
//  Copyright © 2017 Netguru.co. All rights reserved.
//
import UIKit

public typealias Constraint = (_ layoutView: UIView) -> NSLayoutConstraint

//
// Solution based on http://chris.eidhof.nl/post/micro-autolayout-dsl/
//
public extension UIView {
    
    /// Adds constraints using NSLayoutAnchors, based on description provided in params.
    /// Please refer to helper equal funtions for info how to generate constraints easily.
    ///
    /// - Parameter constraintDescriptions: constrains array
    /// - Returns: created constraints
    @discardableResult func addConstraints(_ constraintDescriptions: [Constraint]) -> [NSLayoutConstraint] {
        self.translatesAutoresizingMaskIntoConstraints = false
        let constraints = constraintDescriptions.map { $0(self) }
        NSLayoutConstraint.activate(constraints)
        return constraints
    }
    
    @discardableResult func addConstraints(_ constraintDescriptions: Constraint...) -> [NSLayoutConstraint] {
        self.translatesAutoresizingMaskIntoConstraints = false
        let constraints = constraintDescriptions.map { $0(self) }
        NSLayoutConstraint.activate(constraints)
        return constraints
    }
    
    @discardableResult func addNonActiveConstraints(_ constraintDescriptions: [Constraint]) -> [NSLayoutConstraint] {
        self.translatesAutoresizingMaskIntoConstraints = false
        let constraints = constraintDescriptions.map { $0(self) }
        return constraints
    }
}


// MARK: NEW METHODS


/// Example: `align(my: \.widthAnchor, with: \.heightAnchor, of: view)`


public func align<Anchor>(my from: KeyPath<UIView, Anchor>,
                          with to : KeyPath<UIView, Anchor>,
                          of view: UIView,
                          multBy multiplier: CGFloat = 1,
                          plus constant: CGFloat = 0) -> Constraint where Anchor: NSLayoutDimension
{
    return { layoutView in
        let myAnchor = layoutView[keyPath: from]
        let otherViewAnchor = view[keyPath: to]
        return myAnchor.constraint(
            equalTo: otherViewAnchor,
            multiplier: multiplier,
            constant: constant
        )
    }
    
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



// MARK: OLD VERSION


/// Describes relation between dimension of two views
/// Example: `equal(logoImageView, \.widthAnchor, \.heightAnchor, constant: 80)`
///
/// - Parameters:
///   - view: view that constraint is related from
///   - from: constraint key path of current view
///   - to: constraint key path of related view
///   - multiplier: multiplier
///   - constant: value
/// - Returns: created constraint
public func equal<Anchor>(_ view: UIView,
                          _ from: KeyPath<UIView, Anchor>,
                          _ to: KeyPath<UIView, Anchor>,
                          multiplier: CGFloat = 1,
                          constant: CGFloat = 0) -> Constraint where Anchor: NSLayoutDimension {
    return { layoutView in
        layoutView[keyPath: from].constraint(equalTo: view[keyPath: to],multiplier: multiplier, constant: constant)
    }
}








/// Describes constraint that is equal to constraint from different view.
/// Example: `equal(superView, \.centerXAnchor) will align view centerXAnchor to superview centerXAnchor`
///
/// - Parameters:
///   - view: that constrain should relate to
///   - to: constraints key path
/// - Returns: created constraint
public func equal<Anchor, Axis>(_ view: UIView,
                                _ to: KeyPath<UIView, Anchor>) -> Constraint where Anchor: NSLayoutAnchor<Axis> {
    return { layoutView in
        layoutView[keyPath: to].constraint(equalTo: view[keyPath: to])
    }
}


/// Describes constraint that will be equal to constant
/// Example: `equal(\.heightAnchor, to: 36) will create height constraint with value 36`
///
/// - Parameters:
///   - keyPath: constraint key path
///   - constant: value
/// - Returns: created constraint
public func equal<LayoutDimension>(dimension keyPath: KeyPath<UIView, LayoutDimension>,
                                   to constant: CGFloat) -> Constraint where LayoutDimension: NSLayoutDimension {
    return { layoutView in
        layoutView[keyPath: keyPath].constraint(equalToConstant: constant)
    }
}


/// Describes relation between constraints of two views
/// Example: `equal(logoImageView, \.topAnchor, \.bottomAnchor, constant: 80)`
/// will create constraint where topAnchor of current view is linked to bottomAnchor of passed view with offset 80
///
/// - Parameters:
///   - view: view that constraint is related from
///   - from: constraint key path of current view
///   - to: constraint key path of related view
///   - constant: value
/// - Returns: created constraint
public func equal<Anchor, Axis>(_ view: UIView,
                                _ from: KeyPath<UIView, Anchor>,
                                _ to: KeyPath<UIView, Anchor>,
                                constant: CGFloat = 0) -> Constraint where Anchor: NSLayoutAnchor<Axis> {
    return { layoutView in
        layoutView[keyPath: from].constraint(equalTo: view[keyPath: to], constant: constant)
    }
}

/// Describes relation between constraints of two views
/// Example: `equal(logoImageView, \.topAnchor, \.bottomAnchor, lessOrEqual: 80)`
/// will create constraint where topAnchor of current view is linked to bottomAnchor of passed view with offset less or equal 80
///
/// - Parameters:
///   - view: view that constraint is related from
///   - from: constraint key path of current view
///   - to: constraint key path of related view
///   - constant: value
/// - Returns: created constraint
public func equal<Anchor, Axis>(_ view: UIView,
                                _ from: KeyPath<UIView, Anchor>,
                                _ to: KeyPath<UIView, Anchor>,
                                lessOrEqual: CGFloat) -> Constraint where Anchor: NSLayoutAnchor<Axis> {
    return { layoutView in
        layoutView[keyPath: from].constraint(lessThanOrEqualTo: view[keyPath: to], constant: lessOrEqual)
    }
}

/// Describes relation between constraints of two views
/// Example: `equal(logoImageView, \.topAnchor, \.bottomAnchor, greaterOrEqual: 80)`
/// will create constraint where topAnchor of current view is linked to bottomAnchor of passed view with offest greater or equal to 80
///
/// - Parameters:
///   - view: view that constraint is related from
///   - from: constraint key path of current view
///   - to: constraint key path of related view
///   - constant: value
/// - Returns: created constraint
public func equal<Anchor, Axis>(_ view: UIView,
                                _ from: KeyPath<UIView, Anchor>,
                                _ to: KeyPath<UIView, Anchor>,
                                greaterOrEqual: CGFloat) -> Constraint where Anchor: NSLayoutAnchor<Axis> {
    return { layoutView in
        layoutView[keyPath: from].constraint(greaterThanOrEqualTo: view[keyPath: to], constant: greaterOrEqual)
    }
}


/// Describes constraints from diffrent views where anchors should match with passed offset
/// Example: `equal(self, \.bottomAnchor, constant: -37)` will align bottomAnchors of current and passed view with offset -37
///
/// - Parameters:
///   - view: view that constraint is related from
///   - keyPath: constraint key path
///   - constant: value
/// - Returns: created constraint
public func equal<Axis, Anchor>(_ view: UIView,
                                _ keyPath: KeyPath<UIView, Anchor>,
                                constant: CGFloat = 0) -> Constraint where Anchor: NSLayoutAnchor<Axis> {
    return equal(view, keyPath, keyPath, constant: constant)
}


/// Describes array of constraints that will pin view to its superview.
/// Example `view.addConstraints(equalToSuperview())`
///
/// - Parameter insets: Optional insets parameter. By default it's set to .zero.
/// - Returns: Array of `Constraint`.
/// - Warning: This method uses force-unwrap on view's superview!

public func equalToSafeArea(superView view: UIView, with insets: UIEdgeInsets = .zero) -> [Constraint] {
    return [
        equal(view, \UIView.topAnchor,   \UIView.safeLayoutGuide.topAnchor, constant: insets.top),
        equal(view, \UIView.bottomAnchor, \UIView.safeLayoutGuide.bottomAnchor, constant: -insets.bottom),
        equal(view, \UIView.leadingAnchor, \UIView.safeLayoutGuide.leadingAnchor, constant: insets.left),
        equal(view, \UIView.trailingAnchor, \UIView.safeLayoutGuide.trailingAnchor, constant: -insets.right)
    ]
}

public func equalTo(superView view: UIView, with insets: UIEdgeInsets = .zero) -> [Constraint] {
    return [
        equal(view, \UIView.topAnchor, constant: insets.top),
        equal(view, \UIView.bottomAnchor, constant: -insets.bottom),
        equal(view, \UIView.leadingAnchor, constant: insets.left),
        equal(view, \UIView.trailingAnchor, constant: -insets.right)
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
