//
//  MonsterStepper.swift
//  MonsterTours
//
//  Created by Yesbol Kulanbekov on 6/4/18.
//  Copyright © 2018 Monster Tours. All rights reserved.
//


import UIKit


class MonsterStepper: UIView {
    
    var incremented = Command.nop
    var decremented = Command.nop
    var upperLimit  = 100
    
    struct Props {
        
        static func def() -> Props{
            return Props()
        }
    }
    
    let subs = MonsterStepper.Subs()
    
    var count = 0 {
        didSet {
            subs.textLabel.text = "\(count)"
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        render(with: .def())
        layout(in: self)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}



extension MonsterStepper.Props {
    init(with something: String) {
        
    }
}


extension MonsterStepper: Renderable {
    struct Subs {
        let leftButton = UIButton {
            $0.setBackgroundImage(UIImage(named: "countMinus"), for: .normal)
            $0.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        }
        
        let textLabel = UILabel{
            $0.text = "0"
            $0.font = .systemFont(ofSize: 28)
        }
        
        let rightButton = UIButton {
            $0.setBackgroundImage(UIImage(named: "countPlus"), for: .normal)
            $0.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        }
    }
    
    func setup() {
        Layout.falseMask(self)
        subs.leftButton.addTarget(self, action: #selector(decrement), for: .touchUpInside)
        subs.rightButton.addTarget(self, action: #selector(increment), for: .touchUpInside)

    }
    
    func render(with props: MonsterStepper.Props) {
        
    }
    
    func layout(in mainView: MonsterStepper) {
        MonsterStepperLayout(mainView: mainView, subViews: subs).paint()
    }
    
    
    @objc func increment() {
        guard count < upperLimit else { return }
        incremented.perform()
        count = count + 1
    }
    
    @objc func decrement() {
        guard count >= 1 else { return }
        decremented.perform()
        count = count - 1
    }
    
}



struct MonsterStepperLayout: UIViewLayout {
    var mainView: MonsterStepper
    var subViews: MonsterStepper.Subs
    
    func addSubViews() {
        mainView.addSubview(rootStack)
        rootStack.addArrangedSubview(subViews.leftButton)
        rootStack.addArrangedSubview(subViews.textLabel)
        rootStack.addArrangedSubview(subViews.rightButton)
    }
    
    func addConstraints() {
        rootStack.fillSuperview()
        subViews.leftButton.widthAnchor.constraint(equalToConstant: 25).isActive = true
        subViews.leftButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        subViews.rightButton.widthAnchor.constraint(equalToConstant: 25).isActive = true
        subViews.rightButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
    }
    
    let rootStack = UIStackView { stack in
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.alignment = .fill
        stack.spacing = 18
    }
    
}










