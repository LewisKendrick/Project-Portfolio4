//
//  Goal.swift
//  LewisKendrick_KeenFit
//
//  Created by kendrick lewis on 11/7/17.
//  Copyright © 2017 kendrick lewis. All rights reserved.
//

import Foundation
import Firebase

class Goal
{
    var total_Calories: Double?
    var total_Carbs: Double?
    var total_Cholesterol: Double?
    var total_Dietary: Double?
    var total_Fat:Double?
    var total_Protein:Double?
    var total_SaturatedFat:Double?
    var total_Sodium:Double?
    var total_Sugars:Double?
    
    init()
    {
        total_Calories = nil
        total_Carbs = nil
        total_Cholesterol = nil
        total_Dietary = nil
        total_Fat = nil
        total_Protein = nil
        total_SaturatedFat = nil
        total_Sodium = nil
        total_Sugars = nil
    }
    
    init(iCalories: Double?, iCarbs: Double?, iCholesterol: Double?, iDietary: Double?, iFat: Double?, iProtein: Double? , iSaturatedFat: Double?, iSodium: Double?, iSugars:Double?)
    {
        total_Calories = iCalories
        total_Carbs = iCarbs
        total_Cholesterol = iCholesterol
        total_Dietary = iDietary
        total_Fat = iFat
        total_Protein = iProtein
        total_SaturatedFat = iSaturatedFat
        total_Sodium = iSodium
        total_Sugars = iSugars
    }
}
