//
//  MealTableViewController.swift
//  FoodTracker
//
//  Created by newmac on 4/17/17.
//  Copyright © 2017 Sachin. All rights reserved.
//

import UIKit

class MealTableViewController: UITableViewController {

    
    var meals = [Meal]()
    override func viewDidLoad() {
        
        super.viewDidLoad()
        loadSampleMeals()
        }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return meals.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as? MealTableViewCell else {
            
            fatalError("Table cannot be dequeued")
        }

        let meal = meals[indexPath.row]
        cell.nameLabel.text = meal._name
        cell.photoImageView.image = meal._photo
        cell.ratingControl.rating = meal._ratings
        
        return cell
    }
    
    private func loadSampleMeals() {
        
        let photo1 = UIImage(named: "meal1")
        let photo2 = UIImage(named: "meal2")
        let photo3 = UIImage(named: "meal3")
        
        guard let meal1 = Meal(name: "Caprese Salad", photo: photo1, ratings: 4) else {
            
            fatalError("Unable to instantiate")
        }
        
        guard let meal2 = Meal(name: "Banana butterfinger", photo: photo2, ratings: 3) else {
            
            fatalError("Unable to instantiate")
            
        }
        
        guard let meal3 = Meal(name: "cheese lassang", photo: photo3, ratings: 1) else {
            
            fatalError("Unable to instantiate")
        }
        
        meals += [meal1, meal2, meal3]
    }


}
