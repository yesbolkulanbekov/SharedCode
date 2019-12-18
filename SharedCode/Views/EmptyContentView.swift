//
//  EmptyContentView.swift
//  MonsterTours
//
//  Created by Yesbol Kulanbekov on 7/1/18.
//  Copyright © 2018 Monster Tours. All rights reserved.
//

import UIKit



public class EmptyContentView: UIView {
    
    public struct Props {
        public let title: String
        public let subtitle: String
        
        public init(title: String, subtitle: String) {
            self.title = title
            self.subtitle = subtitle
        }
        
        static let zero = Props(
            title: "Main Text", subtitle: "Subtitle"
        )
    }
    
    struct Subviews {
        
        let icon = UIImageView()
        let title = UILabel()
        let subtitle = UILabel()
        
        func render(with props: Props) {
            title.text = props.title
            subtitle.text = props.subtitle
        }
        
        func renderConstantData() {
            icon.image = UIImage(named: "emptyBasket")
            title.text = "Main Text"
            subtitle.text = "Subtitle"
        }
    }
    
    /// Properties
    
    let sv = Subviews()
    
    public var props = Props.zero {
        didSet {
            sv.render(with: props)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSelf()
        configureSubViews()
        styleSubviews()
        sv.render(with: Props.zero)
        sv.renderConstantData()
        EmptyContentViewLayout(for: self).paint()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

/// View configuration, content and styling

extension EmptyContentView {
    
    private func styleSubviews() {
        sv.title.font = .preferredFont(forTextStyle: .largeTitle)
        sv.subtitle.font = .preferredFont(forTextStyle: .subheadline)
    }
    
    private func configureSubViews() {
        
    }
    
    private func setupSelf() {
        
    }
    
}



/// View layout

struct EmptyContentViewLayout {
    
    var rootView: EmptyContentView
    var sv: EmptyContentView.Subviews
    let rootStack = UIStackView(Stack.vStack, Stack.padStack)
    
    init(for rootView: EmptyContentView) {
        self.rootView = rootView
        self.sv = rootView.sv
    }
    
    func paint() {
        addSubViews()
        addConstraints()
    }
}

extension EmptyContentViewLayout {
    
    func addSubViews() {

        rootView.addSubview(sv.title)
        rootView.addSubview(sv.subtitle)
    }
    
    func addConstraints() {
        

        sv.title.addConstraints(
            equal(rootView, Ancs.horizontalCenter),
            equal(rootView, Ancs.verticalCenter)
        )
        
        sv.subtitle.addConstraints(
            equal(sv.title, Ancs.top, Ancs.bottom, constant: 10),
            equal(rootView, Ancs.verticalCenter)
        )
        
    }
    
}
