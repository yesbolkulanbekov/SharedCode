//
//  UIViewController+StoryboardLoading.swift
//  Sam Dods on 23/08/2016.
//

import UIKit

/// Protocol to be extended with implementations
protocol UIViewControllerLoading {}

/// Extend UIViewController to declare that it includes storyboard loading functionality
extension UIViewController : UIViewControllerLoading {}

/// Protocol implementation
extension UIViewControllerLoading where Self : UIViewController {
    
    /**
     Creates a new instance of the class on which this method is invoked,
     instantiated from a storyboard of the given name. If no storyboard
     name is given then a storyboard with the name of the class is used.
     
     - parameter storyboardNameOrNil: The name of the storyboard to load
     from, or nil to indicate the storyboard with the name of the class
     should be used.
     
     - returns: A new instance of the class, loaded from a storyboard.
     */
    static func loadFromStoryboard(storyboardNameOrNil: String? = nil) -> Self {
        return getStoryBoard(for: storyboardNameOrNil).instantiateInitialViewController() as! Self
    }
    
    static func loadFromStoryboardWithNavigation(storyboardNameOrNil: String? = nil) -> UINavigationController {
        return getStoryBoard(for: storyboardNameOrNil).instantiateInitialViewController() as! UINavigationController
    }
    
    static private var className: String {
        let className = "\(self)"
        let components = className.split{$0 == "."}.map ( String.init )
        return components.last!
    }
    
    static private func getStoryBoard(for storyboardNameOrNil: String? = nil) -> UIStoryboard {
        let nibName = storyboardNameOrNil ?? self.className
        return UIStoryboard(name: nibName, bundle: nil)
    }
    
}

