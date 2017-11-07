//
//  MainScreenController.swift
//  LewisKendrick_KeenFit
//
//  Created by kendrick lewis on 11/7/17.
//  Copyright © 2017 kendrick lewis. All rights reserved.
//

import UIKit
import Firebase

class MainScreenController: UIViewController {
   
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
    /* This is the end of my Outlets */
    
    var currentPerson = Person()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        ref = Database.database().reference().child("Users") //setting my reference to start inside of my users node
        ref.child(g_UserID!).observeSingleEvent(of: .value, with: { (snapshot) in
            
            print(snapshot.value)
            // Get user value and set it to the currentPerson object that i have set
            let value = snapshot.value as? NSDictionary
            self.currentPerson.userID = g_UserID!
            self.currentPerson.name = value?["name"] as? String ?? ""
            self.currentPerson.iconID = value?["id_picture"] as? Int ?? 0
            self.currentPerson.groupName = value?["g_name"] as? String ?? ""
            self.currentPerson.weight = value?["weight"] as? Double ?? 0.0
            self.currentPerson.dailyAverage = value?["average_daily"] as? Double ?? 0.0
            self.currentPerson.weeklyAverage = value?["average_weekly"] as? Double ?? 0.0
            self.currentPerson.biWeeklyAverage = value?["average_biWeekly"] as? Double ?? 0.0
            self.currentPerson.currentCalories = value?["currentCalories"] as? Double ?? 0.0
            //let user = User(username: username)
            self.FillSummary()
            // ...
        }) { (error) in
            print(error.localizedDescription)
        }
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Method ment to fill in my values
    func FillSummary()
    {
     _title.text = "Welcome " + currentPerson.name
     _profileICON.image = UIImage(named: "\(currentPerson.iconID)")
     _currentCalories.text = String(currentPerson.currentCalories)
     _currentMeals.text = String("nothing")
     _dailyAverage.text = String(currentPerson.dailyAverage)
     _weeklyAverage.text = String(currentPerson.weeklyAverage)
     _biWeeklyAverage.text = String(currentPerson.biWeeklyAverage)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}