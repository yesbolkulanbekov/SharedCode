
import UIKit


class GenericView: UIView {

    let subViews = GenericView.Subviews()
    
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
    struct Subviews {

    }
    
    func setup() {
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func render(with props: GenericView.Props) {
        
    }
    
    func layout(in mainView: GenericView) {
        GenericViewLayout(mainView: mainView, subViews: subViews).paint()
    }
    
}


/// View layout

struct GenericViewLayout: UIViewLayout {
    
    var mainView: GenericView
    var subViews: GenericView.Subviews
    
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









