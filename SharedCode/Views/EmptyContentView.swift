//
//  EmptyContentView.swift
//  MonsterTours
//
//  Created by Yesbol Kulanbekov on 7/1/18.
//  Copyright © 2018 Monster Tours. All rights reserved.
//

import UIKit


import UIKit


class EmptyContentView: UIView {
    
    let subs = EmptyContentView.Subs()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        render(with: Props())
        layout(in: self)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

/// Props configuration and init

extension EmptyContentView {
    struct Props {
        let text: String
    }
}

extension EmptyContentView.Props {
    init() {
        text = "You have no content!"
    }
}

/// View configuration, content and styling

extension EmptyContentView: Renderable {
    struct Subs {
        let emtyContentWarningLabel = UILabel {
            $0.numberOfLines = 0
            $0.textAlignment = .center
            $0.font = UIFont.preferredFont(forTextStyle: .headline)
        }
    }
    
    func setup() {
        Layout.falseMask(self)
    }
    
    func render(with props: EmptyContentView.Props) {
        subs.emtyContentWarningLabel.text = props.text
    }
    
    func layout(in mainView: EmptyContentView) {
        EmptyContentViewLayout(mainView: mainView, subViews: subs).paint()
    }
    
}

/// View layout

struct EmptyContentViewLayout: UIViewLayout {
    var mainView: EmptyContentView
    var subViews: EmptyContentView.Subs
    
    func addSubViews() {
        mainView.addSubview(subViews.emtyContentWarningLabel)
    }
    
    func addConstraints() {
        subViews.emtyContentWarningLabel.anchor(top: mainView.topAnchor,
                                                leading: mainView.leadingAnchor,
                                                trailing: mainView.trailingAnchor,
                                                padding: UIEdgeInsets(top: 70, left: 30, bottom: 0, right: 30))
    }

    
}










