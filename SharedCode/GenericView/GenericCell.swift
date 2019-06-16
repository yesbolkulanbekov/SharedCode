
import UIKit


class GenericCell: UICollectionViewCell {
    
    struct Subviews {
        
    }
    
    let subViews = GenericCell.Subviews()
    
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

extension GenericCell {
    struct Props {
        
    }
}

extension GenericCell.Props {
    
}

/// View configuration, content and styling

extension GenericCell: Renderable {
    
    private func setupSelf() {
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureSubViews() {
        
    }
    
    func styleSubviews() {
        
    }
    
    func render(with props: GenericCell.Props) {
        
    }
    
    func layout() {
        GenericCellLayout(rootView: self).paint()
    }
    
}


/// View layout

struct GenericCellLayout: UIViewLayout {
    
    var rootView: GenericCell
    var subViews: GenericCell.Subviews
    
    init(rootView: GenericCell) {
        self.rootView = rootView
        self.subViews = rootView.subViews
    }
    
    func addSubViews() {
        rootView.contentView.addSubview(rootStack)
    }
    
    func addConstraints() {
        rootStack.addConstraints(equalTo(superView: rootView.contentView))
    }
    
    let rootStack = UIStackView(Stack.vStack, Stack.padStack)
    
}





class GenericViewTableCell: UITableViewCell {
    
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
    
    /// Properties
    
    let sv = Subviews()
    
    var props = Props.zero {
        didSet {
            sv.render(with: props)
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSelf()
        configureSubViews()
        styleSubviews()
        sv.render(with: Props.zero)
        sv.renderConstantData()
        GenericViewTableCellLayout(for: self).paint()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

/// View configuration, content and styling

extension GenericViewTableCell {
    
    private func styleSubviews() {
        
    }
    
    private func configureSubViews() {
        
    }
    
    private func setupSelf() {
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}



/// View layout

struct GenericViewTableCellLayout {
    
    var sv: GenericViewTableCell.Subviews
    var contentView: UIView
    var containerView: UIView
    let rootStack = UIStackView(Stack.vStack, Stack.padStack)
    
    init(for rootView: GenericViewTableCell) {
        self.contentView = rootView.contentView
        self.sv = rootView.sv
        self.containerView = UIView()
    }
    
    func paint() {
        addSubViews()
        addConstraints()
    }
}

extension GenericViewTableCellLayout {
    
    func addSubViews() {
        
    }
    
    func addConstraints() {
        
    }
    
}





