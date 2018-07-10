
import UIKit


class GenericView: UIView {

    let subs = GenericView.Subs()
    
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

extension GenericView {
    struct Props {
        
    }
}

extension GenericView.Props {

}

/// View configuration, content and styling

extension GenericView: Renderable {
    struct Subs {

    }
    
    func setup() {
        Layout.falseMask(self)
    }
    
    func render(with props: GenericView.Props) {
        
    }
    
    func layout(in mainView: GenericView) {
        GenericViewLayout(mainView: mainView, contents: subs).paint()
    }
    
}


/// View layout

struct GenericViewLayout: UIViewLayout {
    var mainView: GenericView
    var contents: GenericView.Subs
    
    func addSubViews() {
        mainView.addSubview(rootStack)

    }
    
    func addConstraints() {
        rootStack.fillSuperview()
    }
    
    let rootStack = UIStackView { stack in
        stack.axis = .vertical
        stack.distribution = .fill
        stack.alignment = .fill
        stack.spacing = 8
    }
    
}









