//
//  LoadingHandler.swift
//  SharedCode
//
//  Created by Yesbol Kulanbekov on 6/7/19.
//  Copyright © 2019 Lobster. All rights reserved.
//

import UIKit

public protocol LoadingHandler {
    func showLoading()
    func hideLoading()
}

public extension LoadingHandler where Self: UIViewController  {
    
    public func showLoading() {
        let indicator = makeActivityIndicator()
        view.addSubview(indicator)
        
        view.addSubview(makeDimmingView())
        
        NSLayoutConstraint.activate([
            indicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            indicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ])
    }
    
    public func hideLoading() {
        guard let indicator = view.viewWithTag(indicatorViewTag) else {
            return
        }
        
        indicator.removeFromSuperview()
        
        guard let dimmingView = view.viewWithTag(dimmingViewTag) else {
            return
        }
        
        dimmingView.removeFromSuperview()
    }
    
    private func makeActivityIndicator() -> UIActivityIndicatorView {
        if let indicator = view.viewWithTag(indicatorViewTag) as? UIActivityIndicatorView {
            return indicator
        }
        
        let indicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.tag = indicatorViewTag
        indicator.startAnimating()
        return indicator
    }
    
    private func makeDimmingView() -> UIView {
        if let dimmingView = view.viewWithTag(dimmingViewTag)  {
            return dimmingView
        }
        let dimmingView = UIView()
        dimmingView.translatesAutoresizingMaskIntoConstraints = false
        dimmingView.tag = dimmingViewTag
        dimmingView.backgroundColor = UIColor(white: 0.0, alpha: 0.5)
        dimmingView.frame = view.frame
        return dimmingView
    }
}

private let indicatorViewTag = 123456
private let dimmingViewTag = 2131433242324


