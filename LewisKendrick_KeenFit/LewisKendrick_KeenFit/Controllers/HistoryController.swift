//
//  HistoryController.swift
//  LewisKendrick_KeenFit
//
//  Created by kendrick lewis on 11/12/17.
//  Copyright © 2017 kendrick lewis. All rights reserved.
//

import UIKit
import Firebase

class HistoryController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var _UserIcon: UIImageView!
    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var topLabel: UILabel!
    
    var results = [Meals]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        _UserIcon.image = UIImage(named: "\(g_pictureID)")
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //setting up my table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell_01", for: indexPath) as? HistoryCell //I am starting my segue here
            
            else
        {
            return tableView.dequeueReusableCell(withIdentifier: "cell_01", for: indexPath)
        }
        
        let currentCell = results[indexPath.row]
        cell.itemName.text = currentCell.name
        cell.itemCalories.text = String(currentCell.calories!)
        cell.brandName.text = currentCell.brandName
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        performSegue(withIdentifier: "toAddDisplay", sender: nil)
    }
    
    @IBAction func DoneButtonPressed(_ sender: UIButton)
    {
        navigationController?.popViewController(animated: true)
    }
    
    //------------------------
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let indexPath = self.myTableView?.indexPathForSelectedRow
        {
            let selectedTable = results[indexPath.row]
            if let dVC: AddFoodSecondController = segue.destination as? AddFoodSecondController
            {
                dVC.mealDetails = selectedTable
            }
        }
    }
}

