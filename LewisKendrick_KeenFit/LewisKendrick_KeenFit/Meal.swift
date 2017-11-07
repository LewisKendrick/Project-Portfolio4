//
//  Meal.swift
//  LewisKendrick_KeenFit
//
//  Created by kendrick lewis on 11/7/17.
//  Copyright © 2017 kendrick lewis. All rights reserved.
//

import Foundation
import Firebase

class Meals
{
    var id:String?
    var calories: Double?
    var carbs: Double?
    var cholesterol: Double?
    var dietary: Double?
    var fat:Double?
    var protein:Double?
    var saturatedFat:Double?
    var sodium:Double?
    var sugars:Double?
    var servings:Double?
    var date:Date?
    
    init()
    {
        id = nil
        calories = nil
        carbs = nil
        cholesterol = nil
        dietary = nil
        fat = nil
        protein = nil
        saturatedFat = nil
        sodium = nil
        sugars = nil
        servings = nil
        date = nil
    }
}
