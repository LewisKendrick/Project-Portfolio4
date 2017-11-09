//
//  AddFoodSecondController.swift
//  LewisKendrick_KeenFit
//
//  Created by kendrick lewis on 11/7/17.
//  Copyright © 2017 kendrick lewis. All rights reserved.
//

import UIKit

class AddFoodSecondController: UIViewController {

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
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        let totalFat = (mealDetails?.fat)! * stepCounter
        let saturatedFat = (mealDetails?.saturatedFat)! * stepCounter
        let calories = (mealDetails?.calories)! * stepCounter
        let cholesterol = (mealDetails?.cholesterol)! * stepCounter
        let sodium = (mealDetails?.sodium)! * stepCounter
        let carbs = (mealDetails?.carbs)! * stepCounter
        let dietary = (mealDetails?.dietary)! * stepCounter
        let sugars = (mealDetails?.sugars)! * stepCounter
        let protein = (mealDetails?.protein)! * stepCounter
        
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
        navigationController?.popViewController(animated: true)
    }
    

}
