//
//  Meal.swift
//  FoodTracker
//
//  Created by newmac on 4/13/17.
//  Copyright © 2017 Sachin. All rights reserved.
//

import Foundation
import UIKit

class Meal {
    
    //Mark: Properties
    
    var _name: String = ""
    var _photo: UIImage?
    var _ratings: Int = 0
    
    //Mark: Initialization
    
    init?(name: String, photo: UIImage?, ratings: Int) {
        
        self._name = name
        self._photo = photo
        self._ratings = ratings
        
    }
    
    var name: String {
        
        if _name == nil {
            _name = ""
        }
        return _name
    }
    
    var photo: UIImage {
        
        if _photo == nil {
            _photo = nil
        }
        return _photo!
    }
    
    var ratings: Int {
        
        if _ratings == nil {
            _ratings = 0
        }
        return _ratings
    }
}
