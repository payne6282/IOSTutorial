//
//  ViewController.swift
//  FoodTracker
//
//  Created by newmac on 4/4/17.
//  Copyright © 2017 Sachin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var NameTextField: UITextField!
    @IBOutlet weak var mealNameLabel: UILabel!
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NameTextField.delegate = self
        
        
    }
    
    //User cancels image
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    //
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage
            
            else {
                fatalError("Expected a dictionary of images, but gave the following -  /(info)")
        }
        
        photoImageView.image = selectedImage
        dismiss(animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        mealNameLabel.text = textField.text
    }
    
    
    @IBAction func setDefaultTitleButton(_ sender: AnyObject) {
        NameTextField.text = "Default text"
    }
    
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        //Hide the keyboard
        NameTextField.resignFirstResponder()
        let imagePickController = UIImagePickerController()
        imagePickController.sourceType = .photoLibrary
        imagePickController.delegate = self
        
        //make sure view controller is notified when user picks an image
        present(imagePickController, animated: true, completion: nil)
    }
    
    
}

