
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
        rootView.addSubview(rootStack)
    }
    
    func addConstraints() {
        rootStack.addConstraints(equalToSuperview())
    }
    
    let rootStack = UIStackView(Stack.verStack, Stack.marginStack)
    
}









