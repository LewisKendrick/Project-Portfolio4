//
//  MainScreenController.swift
//  LewisKendrick_KeenFit
//
//  Created by kendrick lewis on 11/7/17.
//  Copyright © 2017 kendrick lewis. All rights reserved.
//

import UIKit
import Firebase

class MainScreenController: UIViewController, UITextFieldDelegate {
   
    var ref: DatabaseReference!
    
    /* This Space is for all of my outlets */
    @IBOutlet weak var _title: UILabel!
    @IBOutlet weak var _profileICON: UIImageView!
    @IBOutlet weak var _currentCalories: UILabel!
    @IBOutlet weak var _goalTotal: UILabel!
    @IBOutlet weak var _currentMeals: UILabel!
    @IBOutlet weak var _dailyAverage: UILabel!
    @IBOutlet weak var _weeklyAverage: UILabel!
    @IBOutlet weak var _biWeeklyAverage: UILabel!
    @IBOutlet weak var _QuickSearch: UITextField!
    /* This is the end of my Outlets */
    
    var currentPerson = Person()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        GrabFirebaseData()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        GrabFirebaseData()
        //FillMeals()
        //FillSummary()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Method ment to fill in my values
    func FillSummary()
    {
     _title.text = "Welcome \n" + currentPerson.name
     _profileICON.image = UIImage(named: "\(currentPerson.iconID)")
        _currentCalories.text = String(format: "%.1f", currentPerson.currentCalories) + " kcal"
     _goalTotal.text = "\(currentPerson.goal.total_Calories!) kcal" //force unwrap to get right of the optional word
     _currentMeals.text = String(currentPerson.getMealCount)
     _dailyAverage.text = String(format: "%.1f", currentPerson.getDailyAverage) + " /kcal"
     _weeklyAverage.text = String(format: "%.1f", currentPerson.getWeeklyAverage) + " /kcal"
     _biWeeklyAverage.text = String(format: "%.1f", currentPerson.getBiWeeklyAverage) + " /kcal"
    }
    
    func GrabFirebaseData()
    {
        ref = Database.database().reference().child("Users") //setting my reference to start inside of my users node
        ref.child(g_UserID!).observeSingleEvent(of: .value, with: { (snapshot) in
            
            print(snapshot.value)
            // Get user value and set it to the currentPerson object that i have set
            let value = snapshot.value as? NSDictionary
            self.currentPerson.userID = g_UserID!
            self.currentPerson.name = value?["name"] as? String ?? ""
            self.currentPerson.iconID = value?["id_picture"] as? Int ?? 1
            self.currentPerson.groupName = value?["g_name"] as? String ?? ""
            self.currentPerson.weight = value?["weight"] as? Double ?? 0.0
            self.currentPerson.dailyAverage = value?["average_daily"] as? Double ?? 0.0
            self.currentPerson.weeklyAverage = value?["average_weekly"] as? Double ?? 0.0
            self.currentPerson.biWeeklyAverage = value?["average_biWeekly"] as? Double ?? 0.0
            self.currentPerson.currentCalories = value?["current_Calories"] as? Double ?? 0.0
            
            //I have to now set a way for me to grab the information inside of goals
            var userGoals = Goal()
            let goalsNode = value?["goals"] as? NSDictionary
            userGoals.total_Calories = goalsNode?["total_calories"] as? Double ?? 0.0
            userGoals.total_Carbs = goalsNode?["total_carbs"] as? Double ?? 0.0
            userGoals.total_Cholesterol = goalsNode?["total_cholesterol"] as? Double ?? 0.0
            userGoals.total_Dietary = goalsNode?["total_dietary"] as? Double ?? 0.0
            userGoals.total_Fat = goalsNode?["total_fat"] as? Double ?? 0.0
            userGoals.total_Protein = goalsNode?["total_protein"] as? Double ?? 0.0
            userGoals.total_SaturatedFat = goalsNode?["total_saturatedfat"] as? Double ?? 0.0
            userGoals.total_Sodium = goalsNode?["total_sodium"] as? Double ?? 0.0
            userGoals.total_Sugars = goalsNode?["total_sugars"] as? Double ?? 0.0
            
            self.currentPerson.goal = userGoals
            
            //at this point I need to check if the user has any meals logged in
            //so I redo the last view steps inside of a method
            g_pictureID = self.currentPerson.iconID
            self.FillMeals()
            self.FillSummary()
            // ...
        }) { (error) in
            print(error.localizedDescription)
        }
        
        
    }
    
    func FillMeals()
    {
        currentPerson.meals = []
        var newMeal = Meals()
        
        ref = Database.database().reference().child("Meals") //setting my reference to start inside of my users node
        ref.child(g_UserID!).observeSingleEvent(of: .value, with: { (snapshot) in
            
            if let itemDict = snapshot.value as? Dictionary<String, Dictionary<String, Any>>
            {
                for (key, value) in itemDict
                {
                    // Get user value and set it to the currentPerson object that i have set
                   // let value = snapshot.value as? NSDictionary
                    newMeal.id = value["id"] as? String ?? "failed"
                    newMeal.name = value["name"] as? String ?? "failed"
                    newMeal.brandName = value["brandname"] as? String ?? "failed"
                    newMeal.calories = value["calories"] as? Double ?? 0.0
                    newMeal.carbs = value["carbs"] as? Double ?? 0.0
                    newMeal.cholesterol = value["cholesterol"] as? Double ?? 0.0
                    newMeal.dietary = value["dietary"] as? Double ?? 0.0
                    newMeal.fat = value["fat"] as? Double ?? 0.0
                    newMeal.protein = value["protein"] as? Double ?? 0.0
                    newMeal.saturatedFat = value["saturatedfat"] as? Double ?? 0.0
                    newMeal.sodium = value["sodium"] as? Double ?? 0.0
                    newMeal.sugars = value["sugars"] as? Double ?? 0.0
                    newMeal.servings = value["servings"] as? Double ?? 0.0
                    //now i must grab the date and convert it
                    let stringDate = value["date"] as? String ?? ""
                    
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "yyyy-MM-dd"
                    let convertedDate = dateFormatter.date(from: stringDate)
                    //setting the date into my class variable
                    newMeal.date = convertedDate
                    self.currentPerson.meals.append(newMeal)
                    newMeal = Meals() //added this because I kept getting duplicates
    
                }
                 g_CurrentPerson = self.currentPerson
                self.FillSummary()
            }
            
        }) { (error) in
            print(error.localizedDescription)
        }
    }
    
    
    //-----------------------------------------------------------------
    //-----------------------------------------------------------------
    
    @IBAction func LogOutSelected(_ sender: UIButton)
    {
        g_CurrentPerson = Person()
        g_UserID = ""
        g_pictureID = 1
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func QuickSearchPressed(_ sender: UIButton)
    {
        if _QuickSearch.text?.isEmpty == false
        {
            performSegue(withIdentifier: "toQuickAdd", sender: nil)
        }
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        g_CurrentPerson = currentPerson
        if segue.identifier == "toHistory"
        {
            if let hVC: HistoryController = segue.destination as? HistoryController
            {
                hVC.results = currentPerson.meals as! [Meals]
            }
            
        }
        else if segue.identifier == "toGoals"
        {
            if let gVC: GoalsController = segue.destination as? GoalsController
            {
                gVC.currentPerson = currentPerson
            }
        }
        else if segue.identifier == "toEntries"
        {
            if let eVC: EntriesController = segue.destination as? EntriesController
            {
                eVC.thePerson = currentPerson
            }
        }
        
        else if segue.identifier == "toAddFoodOne"
        {
            g_CurrentPerson = currentPerson
        }
        else if segue.identifier == "toQuickAdd"
        {
            g_CurrentPerson = currentPerson
            if let aVC: AddFoodFirstController = segue.destination as? AddFoodFirstController
            {
                aVC.searchText = _QuickSearch.text!
            }
        }
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
        moveTextField(textField: textField, moveDistance: -250, up: true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField)
    {
        moveTextField(textField: textField, moveDistance: -250, up: false)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }

}
