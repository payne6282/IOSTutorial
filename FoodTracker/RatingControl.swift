//
//  RatingControl.swift
//  FoodTracker
//
//  Created by newmac on 4/12/17.
//  Copyright © 2017 Sachin. All rights reserved.
//

import UIKit

@IBDesignable class RatingControl: UIStackView {
    
    private var ratingButtons = [UIButton]()
    var rating = 0
    @IBInspectable var starSize: CGSize = CGSize(width: 44.0, height: 44.0) {
        
        didSet {
            self.setupButtons()
        }
    }
    
    @IBInspectable var starCount = 5 {
        
        didSet {
            self.setupButtons()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupButtons()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        self.setupButtons()
    }
    
    private func setupButtons() {
        
        for button in ratingButtons {
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        
        ratingButtons.removeAll()
        
        let bundle = Bundle(for: type(of: self))
        let filledStar = UIImage(named: "filledStar", in: bundle, compatibleWith: self.traitCollection)
        let emptyStar = UIImage(named: "emptyStar", in: bundle, compatibleWith: self.traitCollection)
        let highlightedStar = UIImage(named: "highlightedStar", in: bundle, compatibleWith: self.traitCollection)
        
        
        for _ in 0 ..< starCount {
            let button = UIButton()
        
            button.setImage(emptyStar, for: .normal)
            button.setImage(filledStar, for: .selected)
            button.setImage(highlightedStar, for: .highlighted)
            button.setImage(highlightedStar, for: [.highlighted, .selected])
            
            button.translatesAutoresizingMaskIntoConstraints = true
            button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
            button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
            
            button.addTarget(self, action: #selector(RatingControl.ratingButtonPressed(button:)), for: .touchUpInside)
            addArrangedSubview(button)
            ratingButtons.append(button)
        }
    }
    
    func ratingButtonPressed(button: UIButton) {
        
        guard let index = ratingButtons.index(of: button) else {
            fatalError("Button not present in the array")
        }
        
        let selectedRating = index + 1
        
        if selectedRating == rating {
            rating = 0
        }
        else {
            rating = selectedRating
        }
        
        
        print("Button pressed")
    }
    
}
