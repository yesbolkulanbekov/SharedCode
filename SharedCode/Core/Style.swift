// The MIT License (MIT)
//
// Copyright (c) 2018 Alexander Grebenyuk (github.com/kean).

import UIKit


public enum Style {
    public enum Label {
        public static func headline(_ label: UILabel) {
            label.font = UIFont.preferredFont(forTextStyle: .headline)
            label.textColor = Color.darkGray
        }

        public static func subheadline(_ label: UILabel) {
            label.font = UIFont.preferredFont(forTextStyle: .subheadline)
            label.textColor = Color.gray
        }

        public static func body(_ label: UILabel) {
            label.font = UIFont.preferredFont(forTextStyle: .body)
            label.textColor = Color.darkGray
        }
        
        public static func white(_ label: UILabel) {
            label.text = "Placeholder"
            label.textColor = .white
        }
        
        public static func adjustFont(_ label: UILabel) {
            label.adjustsFontSizeToFitWidth = true
        }
        
    }
}

public enum Stack {
    public static func verStack(_ stack: UIStackView) {
        stack.axis = .vertical
        stack.distribution = .fill
        stack.alignment = .fill
        stack.spacing = 8
    }
    
    public static func marginStack(_ stack: UIStackView) {
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layoutMargins = UIEdgeInsets.init(all: 8)
    }
}

public enum Color {
    public static let mango = rgb(255, 171, 48)
    public static let gray = rgb(98, 111, 126)
    public static let lightGray = rgb(227, 231, 236)
    public static let darkGray = rgb(22, 34, 48)
    public static let purpleApp = UIColor.init(hexString: "401B60")

    private static func rgb(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat, _ a: CGFloat = 1.0) -> UIColor {
        return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: a)
    }
}

public enum Layout {
    public static func falseMask(_ view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
    }
}
