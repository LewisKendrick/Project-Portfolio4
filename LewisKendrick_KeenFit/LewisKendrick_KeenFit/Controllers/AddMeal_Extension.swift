//
//  AddMeal_Extension.swift
//  LewisKendrick_KeenFit
//
//  Created by kendrick lewis on 11/7/17.
//  Copyright © 2017 kendrick lewis. All rights reserved.
//

import Foundation
import UIKit

extension AddFoodFirstController {
    
    func grabJson(jsonUrl: String)
    {
        if let validURL = URL(string: jsonUrl) {
            
            URLSession.shared.dataTask(with: validURL, completionHandler: { (opt_data, opt_response, opt_error) in
                if let err = opt_error { print(err); return }
                
                //Check the response, statusCode, and data
                guard let response = opt_response as? HTTPURLResponse,
                    response.statusCode == 200,
                    let data = opt_data
                    else { return }
                
                do {
                    if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
                        
                        guard let results = json["hits"] as? [Any] else { return }
                        
                        for items in results {
                            guard let info = items as? [String: Any],
                                let fields = info["fields"] as? [String: Any],

                                let item_id = fields["item_id"] as? String,
                                let name =  fields["item_name"] as? String,
                                let brand = fields["brand_name"] as? String,
                                let nfCalories =  fields["nf_calories"] as? Double,
                                let nfCarbs = fields["nf_total_carbohydrate"] as? Double,
                                let nfCholesterol = fields["nf_cholesterol"] as? Double,
                                let nfDietary = fields["nf_dietary_fiber"] as? Double,
                                let nfFat = fields["nf_total_fat"] as? Double,
                                let nfProtein = fields["nf_protein"] as? Double,
                                let nfSaturatedFat = fields["nf_saturated_fat"] as? Double,
                                let nfSodium = fields["nf_sodium"] as? Double,
                                let nfSugars = fields["nf_sugars"] as? Double,
                                let nfServings = fields["nf_serving_size_qty"] as? Double
                                else{ continue }
                            
                            
                            let searchResult = Meals(tId: item_id, tName: name, tBrandName: brand, tCalories: nfCalories, tCarbs: nfCarbs, tCholesterol: nfCholesterol, tDietary: nfDietary, tFat: nfFat, tProtein: nfProtein, tSaturatedFat: nfSaturatedFat, tSodium: nfSodium, tSugar: nfSugars, tServings: nfServings, tDate: nil)
                            
                                self.results.append(searchResult)
                            
                        }
                    }
                }
                catch let localError { print(localError) }
                
                DispatchQueue.main.async {self.tableView.reloadData()}
                
            }).resume()
        }
    }
    
}



