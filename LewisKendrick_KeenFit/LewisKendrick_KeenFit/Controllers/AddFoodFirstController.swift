//
//  AddFoodFirstController.swift
//  LewisKendrick_KeenFit
//
//  Created by kendrick lewis on 11/7/17.
//  Copyright © 2017 kendrick lewis. All rights reserved.
//

import UIKit
import Firebase

class AddFoodFirstController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    //Creating a variable for my results
    var results = [Meals]()
    var searchText = "Apples"

    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        SearchForData(_searchText: searchText)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Configuring my tableView
    //-----------------------------------
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell_01", for: indexPath) as? AddFood_TableViewCell //I am starting my segue here
            
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
        performSegue(withIdentifier: "toSecondAdd", sender: nil)
    }
    
    //-------------------------------------
    //-------------------------------------
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let indexPath = self.tableView?.indexPathForSelectedRow
        {
            let selectedTable = results[indexPath.row]
            if let dVC: AddFoodSecondController = segue.destination as? AddFoodSecondController
            {
                dVC.mealDetails = selectedTable
            }
        }
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        searchBar.resignFirstResponder()
        if searchBar.text != ""
        {
        searchText = searchBar.text!
        }
        
        SearchForData(_searchText: searchText)
        tableView.reloadData()
    }
    @IBAction func DoneButtonPressed(_ sender: UIButton)
    {
        navigationController?.popViewController(animated: true)
    }
    
    //this is the function used to grab the information from the
    func SearchForData(_searchText: String)
    {
        results = []
        if _searchText != ""
        {
            //this makes sure that the users input was one word
            let newSearchText = _searchText.replacingOccurrences(of: " ", with: "")
            
           let DatabaseUrl = "https://api.nutritionix.com/v1_1/search/\(newSearchText)?results=0:30&fields=item_name,brand_name,item_id,nf_calories,item_description,nf_total_fat,nf_saturated_fat,,nf_cholesterol,nf_sodium,nf_total_carbohydrate,nf_dietary_fiber,nf_sugars,nf_protein,nf_potassium&appId=b3aa35a2&appKey=78eca08668db866e38e0f0beec9c9692"
            
            grabJson(jsonUrl: DatabaseUrl)
            
        }
    }

}
