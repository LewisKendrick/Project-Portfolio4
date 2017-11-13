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
    var name: String?
    var brandName: String?
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
        name = nil
        brandName = nil
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
    init(tId: String?, tName: String?, tBrandName: String?, tCalories: Double?, tCarbs: Double?, tCholesterol: Double?, tDietary:Double?, tFat:Double?, tProtein: Double?, tSaturatedFat:Double, tSodium: Double? , tSugar:Double?, tServings: Double?, tDate: Date?)
    {
        id = tId
        name = tName
        brandName = tBrandName
        calories = tCalories
        carbs = tCarbs
        cholesterol = tCholesterol
        dietary = tDietary
        fat = tFat
        protein = tProtein
        saturatedFat = tSaturatedFat
        sodium = tSodium
        sugars = tSugar
        servings = tServings
        date = tDate
    }
}
