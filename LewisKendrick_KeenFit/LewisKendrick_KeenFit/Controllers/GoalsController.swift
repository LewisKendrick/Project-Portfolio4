//
//  GoalsController.swift
//  LewisKendrick_KeenFit
//
//  Created by kendrick lewis on 11/13/17.
//  Copyright © 2017 kendrick lewis. All rights reserved.
//

import UIKit
import Firebase

class GoalsController: UIViewController, UITextFieldDelegate {

    var ref: DatabaseReference!
    
    var currentPerson = Person()
    
    //creating variables for storing my data
    var weightVar = 0.0
    var fatVar = 0.0
    var saturatedVar = 0.0
    var caloriesVar = 0.0
    var cholesterolVar = 0.0
    var sodiumVar = 0.0
    var carbsVar = 0.0
    var dietaryVar = 0.0
    var sugarsVar = 0.0
    var proteinVar = 0.0
    
    //setting up my outlets
    @IBOutlet weak var _UserIcon: UIImageView!
    @IBOutlet weak var _CurrentWeight: UITextField!
    @IBOutlet weak var _TotalFat: UITextField!
    @IBOutlet weak var _SaturatedFat: UITextField!
    @IBOutlet weak var _Calories: UITextField!
    @IBOutlet weak var _Cholesterol: UITextField!
    @IBOutlet weak var _Sodium: UITextField!
    @IBOutlet weak var _Carbs: UITextField!
    @IBOutlet weak var _DietaryFiber: UITextField!
    @IBOutlet weak var _Sugars: UITextField!
    @IBOutlet weak var _Protein: UITextField!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        _UserIcon.image = UIImage(named: "\(g_pictureID)")
        FillValues()
        ref = Database.database().reference().child("Users")
    }
    
    @IBAction func DoneButtonPressed(_ sender: Any)
    {
        ValidateEntries() //call to make sure all my fields are correct
        
        let post = ["total_calories": caloriesVar,
                    "total_carbs": carbsVar,
                    "total_cholesterol": cholesterolVar,
                    "total_dietary": dietaryVar,
                    "total_fat": fatVar,
                    "total_protein": proteinVar,
                    "total_saturatedfat": saturatedVar,
                    "total_sodium": sodiumVar,
                    "total_sugars": sugarsVar]
        
        ref.child(g_UserID!).updateChildValues(["weight": weightVar])
        ref.child(g_UserID!).child("goals").setValue(post)
        
        /*let childUpdates = ["/Users/\(key)": post,
                            "/user-posts/\(userID)/\(key)/": post]
        
        ref.updateChildValues(childUpdates)  */
        navigationController?.popViewController(animated: true)
    }
    
    func ValidateEntries()
    {
        //this will check to see if all fields are valid and set the correct items into preset variables
        weightVar = currentPerson.weight
        fatVar = currentPerson.goal.total_Fat!
        saturatedVar = currentPerson.goal.total_SaturatedFat!
        caloriesVar = currentPerson.goal.total_Calories!
        cholesterolVar = currentPerson.goal.total_Cholesterol!
        sodiumVar = currentPerson.goal.total_Sodium!
        carbsVar = currentPerson.goal.total_Carbs!
        dietaryVar = currentPerson.goal.total_Dietary!
        sugarsVar = currentPerson.goal.total_Sugars!
        proteinVar = currentPerson.goal.total_Protein!
        
        if let weight = Double(_CurrentWeight.text!)
        {
            weightVar = weight
        }
        if let fat = Double(_TotalFat.text!)
        {
            fatVar = fat
        }
        if let saturatedFat = Double(_SaturatedFat.text!)
        {
            saturatedVar = saturatedFat
        }
        if let calories = Double(_Calories.text!)
        {
            caloriesVar = calories
        }
        if let cholesterol = Double(_Cholesterol.text!)
        {
            cholesterolVar = cholesterol
        }
        if let sodium = Double(_Sodium.text!)
        {
            sodiumVar = sodium
        }
        if let carbs = Double(_Carbs.text!)
        {
            carbsVar = carbs
        }
        if let dietary = Double(_DietaryFiber.text!)
        {
            dietaryVar = dietary
        }
        if let sugars = Double(_Sugars.text!)
        {
            sugarsVar = sugars
        }
        if let protein = Double(_Protein.text!)
        {
            proteinVar = protein
        }
    }
    
    func FillValues()
    {
        _CurrentWeight.text = String(currentPerson.weight)
        _TotalFat.text = String(currentPerson.goal.total_Fat!)
        _SaturatedFat.text = String(currentPerson.goal.total_SaturatedFat!)
        _Calories.text = String(currentPerson.goal.total_Calories!)
        _Cholesterol.text = String(currentPerson.goal.total_Cholesterol!)
        _Sodium.text = String(currentPerson.goal.total_Sodium!)
        _Carbs.text = String(currentPerson.goal.total_Carbs!)
        _DietaryFiber.text = String(currentPerson.goal.total_Dietary!)
        _Sugars.text = String(currentPerson.goal.total_Sugars!)
        _Protein.text = String(currentPerson.goal.total_Protein!)
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func moveTextField(textField: UITextField, moveDistance: Int, up: Bool)
    {
        let moveDuration = 0.3
        let movement: CGFloat = CGFloat(up ? moveDistance: -moveDistance)
        
        UIView.beginAnimations("moveTextField", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(moveDuration)
        self.view.frame = self.view.frame.offsetBy(dx: 0, dy: movement)
        UIView.commitAnimations()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField)
    {
        moveTextField(textField: textField, moveDistance: -220, up: true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField)
    {
        moveTextField(textField: textField, moveDistance: -220, up: false)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }

}
