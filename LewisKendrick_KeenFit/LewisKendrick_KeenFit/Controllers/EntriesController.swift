//
//  EntriesController.swift
//  LewisKendrick_KeenFit
//
//  Created by kendrick lewis on 11/15/17.
//  Copyright © 2017 kendrick lewis. All rights reserved.
//

import UIKit

class EntriesController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //outlets that show the users totals
    @IBOutlet weak var _UserIcon: UIImageView!
    @IBOutlet weak var _CurrentDate: UILabel!
    @IBOutlet weak var _TotalFat: UITextView!
    @IBOutlet weak var _Saturated: UITextView!
    @IBOutlet weak var _Calories: UITextView!
    @IBOutlet weak var _Cholesterol: UITextView!
    @IBOutlet weak var _Sodium: UITextView!
    @IBOutlet weak var _Carbs: UITextView!
    @IBOutlet weak var _Dietary: UITextView!
    @IBOutlet weak var _Sugars: UITextView!
    @IBOutlet weak var _Protein: UITextView!
    
    //outlets that show the users goals
    @IBOutlet weak var sTotalFat: UILabel!
    @IBOutlet weak var sSaturated: UILabel!
    @IBOutlet weak var sCalories: UILabel!
    @IBOutlet weak var sCholesterol: UILabel!
    @IBOutlet weak var sSodium: UILabel!
    @IBOutlet weak var sCarbs: UILabel!
    @IBOutlet weak var sDietary: UILabel!
    @IBOutlet weak var sSugars: UILabel!
    @IBOutlet weak var sProtein: UILabel!
    
    
    
    
    var thePerson = Person()
    var filteredMeals = [Meals]()
    var theDate = Date()
    var todaysDate = Date()
    
 
    //now I am setting my variables so I can make changes
    var tFat = 0.0
    var tSaturated = 0.0
    var tCalories = 0.0
    var tCholesterol = 0.0
    var tSodium = 0.0
    var tCarbs = 0.0
    var tDietary = 0.0
    var tSugars = 0.0
    var tProtein = 0.0
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let currentDayString = dateFormatter.string(from: theDate)  //changing the format of my date
        theDate = dateFormatter.date(from: currentDayString)! //making new format a date
        todaysDate = theDate //setting a reminder for what the current day is
        _UserIcon.image = UIImage(named: "\(g_pictureID)")
        DoMath()
        FillValues()
        
        sTotalFat.text = "\(thePerson.goal.total_Fat ?? 0.0)/g"
        sSaturated.text  = "\(thePerson.goal.total_SaturatedFat ?? 0.0)/g"
        sCalories.text = "\(thePerson.goal.total_Calories ?? 0.0)/kcal"
        sCholesterol.text = "\(thePerson.goal.total_Cholesterol ?? 0.0)/mg"
        sSodium.text = "\(thePerson.goal.total_Sodium ?? 0.0)/mg"
        sCarbs.text = "\(thePerson.goal.total_Carbs ?? 0.0)/g"
        sDietary.text = "\(thePerson.goal.total_Dietary ?? 0.0)/g"
        sSugars.text = "\(thePerson.goal.total_Sugars ?? 0.0)/g"
        sProtein.text = "\(thePerson.goal.total_Protein ?? 0.0)/g"
        
        // Do any additional setup after loading the view.
    }

    @IBAction func DoneButtonPressed(_ sender: Any)
    {
        navigationController?.popViewController(animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func NextButtonPressed(_ sender: UIButton)
    {
        if theDate < todaysDate
        {
       theDate = theDate.dayAfter
    print(theDate)
       DoMath()
       FillValues()
        //calling to the tableview
        tableView.reloadData()
        }
    }
    
    @IBAction func PrevButtonPressed(_ sender: UIButton)
    {
        theDate = theDate.dayBefore
        print(theDate)
        DoMath()
        FillValues()
        //calling to the tableview
        tableView.reloadData()
    }
    
    func DoMath()
    {
        //reset everything so i can do the math and finish entering data
        
        tFat = 0.0
        tSaturated = 0.0
        tCalories = 0.0
        tCholesterol = 0.0
        tSodium = 0.0
        tCarbs = 0.0
        tDietary = 0.0
        tSugars = 0.0
        tProtein = 0.0
    
        filteredMeals = [Meals]()
        //now going through all meals and adding information together
        for meals in thePerson.meals
        {
           
            if meals?.date == theDate
            {
            filteredMeals.append(meals!)
            tFat += (meals?.fat)!
            tSaturated += (meals?.saturatedFat)!
            tCalories += (meals?.calories)!
            tCholesterol += (meals?.cholesterol)!
            tSodium += (meals?.sodium)!
            tCarbs += (meals?.carbs)!
            tDietary += (meals?.dietary)!
            tSugars += (meals?.sugars)!
            tProtein += (meals?.protein)!
           }
        
        }
        
    }
    
    func FillValues()
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let currentDay = dateFormatter.string(from: theDate)
        
        
        _CurrentDate.text = currentDay
        _TotalFat.text = String(tFat)
        _Saturated.text = String(tSaturated)
        _Calories.text = String(tCalories)
        _Cholesterol.text = String(tCholesterol)
        _Sodium.text = String(tSodium)
        _Carbs.text = String(tCarbs)
        _Dietary.text = String(tDietary)
        _Sugars.text = String(tSugars)
        _Protein.text = String(tProtein)
        
        tableView.reloadData()
    }
    
    
    
    //setting up tableview
    //-----------------------------------------------------------------------------------
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  filteredMeals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell_01", for: indexPath) as? EntryCell //I am starting my segue here
            
            else
        {
            return tableView.dequeueReusableCell(withIdentifier: "cell_01", for: indexPath)
        }
        
        let currentCell = filteredMeals[indexPath.row]
        cell.itemName.text = currentCell.name
        cell.itemCalories.text = String(currentCell.calories!) + " Kcal"
        cell.brandName.text = currentCell.brandName
        return cell
    }

}

extension Date
{
    var dayAfter: Date
    {    //calculation made to add a  entire day 60 mins 60 hours 24 hours in total
        let aDay: Double = 60 * 60 * 24
        return self.addingTimeInterval(aDay)
    }
    var dayBefore: Date
    {
        let aDay: Double = 60 * 60 * 24
        return self.addingTimeInterval(-(Double(aDay)))
    }
    
    func IsSameDay(compareDate: Date) -> Bool
    {
        
       if self.compare(compareDate) == ComparisonResult.orderedSame
       {
          return true
       }
       else
       {
        return false
       }
    }
}






