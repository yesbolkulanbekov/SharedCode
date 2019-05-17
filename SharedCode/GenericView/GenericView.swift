
import UIKit


class GenericView: UIView {
    
    struct Subviews {
        
    }
    
    let subViews = GenericView.Subviews()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSelf()
        configureSubViews()
        styleSubviews()
        render(with: Props())
        layout()
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
    
    private func setupSelf() {
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureSubViews() {
        
    }
    
    func styleSubviews() {
        
    }
    
    func render(with props: GenericView.Props) {
        
    }
    
    func layout() {
        GenericViewLayout(rootView: self).paint()
    }
    
}


/// View layout

struct GenericViewLayout: UIViewLayout {
    
    var rootView: GenericView
    var subViews: GenericView.Subviews
    
    init(rootView: GenericView) {
        self.rootView = rootView
        self.subViews = rootView.subViews
    }
    
    func addSubViews() {
        rootView.addSubview(rootStack)
    }
    
    func addConstraints() {
        rootStack.addConstraints(equalToSafeArea(superView: rootView))
    }
    
    let rootStack = UIStackView { (stack: UIStackView) in
        stack.axis = .vertical
        stack.distribution = .fill
        stack.alignment = .fill
        stack.spacing = 8
    }
    
}



class GenericViewC: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSelf()
        configureSubViews()
        styleSubviews()
        sv.render(with: Props.zero)
        sv.renderConstantData()
        GenericViewCLayout(for: self).paint()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    /// Properties
    
    let sv = Subviews()
    
    var props = Props.zero {
        didSet {
            sv.render(with: props)
        }
    }
    
}

/// View configuration, content and styling

extension GenericViewC {
    
    struct Props {
        
        static let zero = Props(
            
        )
    }
    
    struct Subviews {
        func render(with props: Props) {
            
        }
        
        func renderConstantData() {
            
        }
    }
    
    func styleSubviews() {
        
    }
    
    private func configureSubViews() {
        
    }
    
    private func setupSelf() {
        translatesAutoresizingMaskIntoConstraints = false
    }
}



/// View layout

struct GenericViewCLayout {
    
    var rootView: GenericViewC
    var sv: GenericViewC.Subviews
    
    init(for rootView: GenericViewC) {
        self.rootView = rootView
        self.sv = rootView.sv
    }
    
    func paint() {
        addSubViews()
        addConstraints()
    }
    
    func addSubViews() {
        rootView.addSubview(rootStack)
        
    }
    
    func addConstraints() {
        rootStack.addConstraints(equalToSafeArea(superView: rootView))
    }
    
    let rootStack = UIStackView(Stack.verStack, Stack.marginStack)

    
}














