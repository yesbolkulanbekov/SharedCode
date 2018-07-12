//
//  RatingsView.swift
//  MonsterTours
//
//  Created by Yesbol Kulanbekov on 4/9/18.
//  Copyright © 2018 Monster Tours. All rights reserved.
//

import UIKit

class RatingsView: UIStackView {
    
    //MARK: Properties
    
    var rating = 0 {
        didSet {
            updateRatingView()
        }
    }
    var starSize: CGSize = CGSize(width: 10.0, height: 10.0) {
        didSet {
            setupButtons()
        }
    }
    var starCount: Int = 5 {
        didSet {
            setupButtons()
        }
    }
    
    private var ratingImages = [UIImageView]()
    
    //MARK: Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        spacing = 4
        setupButtons()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupButtons()
    }



}

extension RatingsView {
    
    //Private Methods
    private func setupButtons() {
        for button in ratingImages {
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        ratingImages.removeAll()
        
        for _ in 0..<starCount {
            let imageView = UIImageView()
            imageView.image = UIImage(named: "PROVIDE_EMPTY_STAR_IMAGE")
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
            imageView.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
            addArrangedSubview(imageView)
            ratingImages.append(imageView)
        }
    }
    
    private func updateRatingView() {
        for index in 0..<rating {
            ratingImages[index].image = UIImage(named: "PROVIDE_FULL_STAR_IMAGE")
        }
    }
    
    
    
    
}
