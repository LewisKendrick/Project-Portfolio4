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
        ref = Database.database().reference()
        
        //retreive my post and listen for changes
      /*  DatabaseHandle = ref.child("Users").child(g_UserID).observe(DataEventType.value, with: { (snapshot) in
            let postDict = snapshot.value as? [String : AnyObject] ?? [:]
            
        }) */
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Method ment to fill in my values
    func FillSummary()
    {
    

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
