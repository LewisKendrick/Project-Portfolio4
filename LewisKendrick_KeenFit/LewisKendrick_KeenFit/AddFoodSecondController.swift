//
//  AddFoodSecondController.swift
//  LewisKendrick_KeenFit
//
//  Created by kendrick lewis on 11/7/17.
//  Copyright © 2017 kendrick lewis. All rights reserved.
//

import UIKit
import Firebase

class AddFoodSecondController: UIViewController {

    var ref: DatabaseReference!
    
    var mealDetails: Meals?
    
    //outlets
    @IBOutlet weak var _TotalFat: UITextField!
    @IBOutlet weak var _SaturatedFat: UITextField!
    @IBOutlet weak var _Calories: UITextField!
    @IBOutlet weak var _Cholesterol: UITextField!
    @IBOutlet weak var _Sodium: UITextField!
    @IBOutlet weak var _Carbohydrates: UITextField!
    @IBOutlet weak var _DietaryFiber: UITextField!
    @IBOutlet weak var _Sugars: UITextField!
    @IBOutlet weak var _Protein: UITextField!
    @IBOutlet weak var _Servings: UILabel!
    @IBOutlet weak var _Name: UILabel!
    @IBOutlet weak var _BrandName: UILabel!
    
    
    //Variables
    var stepCounter = 1.0
    var totalFat = 0.0
    var saturatedFat = 0.0
    var calories = 0.0
    var cholesterol = 0.0
    var sodium = 0.0
    var carbs = 0.0
    var dietary = 0.0
    var sugars = 0.0
    var protein = 0.0
    var servings = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference().child("Meals")
        
        _Name.text = mealDetails?.name
        _BrandName.text = mealDetails?.brandName
        FillValues()
        // Do any additional setup after loading the view.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func StepperUsed(_ sender: UIStepper)
    {
        stepCounter = sender.value
        FillValues()
    }
    
    func FillValues()
    {
        totalFat = (mealDetails?.fat)! * stepCounter
        saturatedFat = (mealDetails?.saturatedFat)! * stepCounter
        calories = (mealDetails?.calories)! * stepCounter
        cholesterol = (mealDetails?.cholesterol)! * stepCounter
        sodium = (mealDetails?.sodium)! * stepCounter
        carbs = (mealDetails?.carbs)! * stepCounter
        dietary = (mealDetails?.dietary)! * stepCounter
        sugars = (mealDetails?.sugars)! * stepCounter
        protein = (mealDetails?.protein)! * stepCounter
        servings = stepCounter
        
       _TotalFat.text = String(totalFat)
       _SaturatedFat.text = String(saturatedFat)
       _Calories.text = String(calories)
       _Cholesterol.text = String(cholesterol)
       _Sodium.text = String(sodium)
       _Carbohydrates.text = String(carbs)
       _DietaryFiber.text = String(dietary)
       _Sugars.text = String(sugars)
       _Protein.text = String(protein)
       _Servings.text = String(stepCounter)
    }
    
    @IBAction func AddMeal(_ sender: UIButton)
    {
        writeUserData()
        navigationController?.popViewController(animated: true)
        //add to database
        
    }
    
    func writeUserData()
    {
        //I am getting my date now and breaking it down by minutes hours and seconds
        let date = Date()
        let calender = Calendar.current
        
        
        let post = [
                    "id": (mealDetails?.id)!,
                    "name": (mealDetails?.name)!,
                    "brandname": (mealDetails?.brandName)!,
                    "calories": (mealDetails?.calories)!,
                    "carbs": (mealDetails?.carbs)!,
                    "cholesterol": (mealDetails?.cholesterol)!,
                    "dietary": (mealDetails?.dietary)!,
                    "fat": (mealDetails?.fat)!,
                    "protein": (mealDetails?.protein)!,
                    "saturatedfat": (mealDetails?.saturatedFat)!,
                    "sodium": (mealDetails?.sodium)!,
                    "sugars": (mealDetails?.sugars)!,
                    "servings": servings,
                    "date": String(describing: date),
                    ] as [String : Any]
        
        ref.child(g_UserID!).child(String(describing: date)).setValue(post)
        
//        let childUpdates = ["/\(g_UserID)/\(key)": post,
//                            "/user-posts/\(userID)/\(key)/": post]
//        ref.updateChildValues(childUpdates)
    }
}

