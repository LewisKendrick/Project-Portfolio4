//
//  Person.swift
//  LewisKendrick_KeenFit
//
//  Created by kendrick lewis on 11/7/17.
//  Copyright © 2017 kendrick lewis. All rights reserved.
//

import Foundation
import Firebase

class Person
{
    var userID:String
    var iconID: Int
    var name:String
    var groupName:String
    var weight:Double
    var birthday:Date?
    var goal: Goal
    var meals: [Meals?]
    var dailyAverage: Double
    var weeklyAverage: Double
    var biWeeklyAverage: Double
    var currentCalories: Double
    
    init()
    {
        userID = ""
        iconID = 1
        name = ""
        groupName = ""
        weight = 0.0
        birthday = nil
        goal = Goal()
        dailyAverage = 0.0
        weeklyAverage = 0.0
        biWeeklyAverage = 0.0
        currentCalories = 0
        meals = []
    }
    
    init(iUserID: String, iIconID: Int, iName: String, iGroupName: String, iWeight: Double, iBirthday: Date?, iGoal:Goal, iDailyAverage: Double, iWeeklyAverage: Double, iBiWeeklyAverage: Double, iCurrentCalories: Double, iMeals: [Meals?])
    {
        userID = iUserID
        iconID = iIconID
        name = iName
        groupName = iGroupName
        weight = iWeight
        birthday = iBirthday
        goal = iGoal
        dailyAverage = iDailyAverage
        weeklyAverage = iWeeklyAverage
        biWeeklyAverage = iBiWeeklyAverage
        currentCalories = iCurrentCalories
        meals = iMeals
    }
    
    //Setting my functions for grabing and manipulating data
    
    var getCurrentCalories : Double
    {
        var theDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let currentDayString = dateFormatter.string(from: theDate)  //changing the format of my date
        theDate = dateFormatter.date(from: currentDayString)! //making new format a date
        
        var total = 0.0
        if meals.isEmpty == true
        {
          return total
        }
        else
        {
            for meal in meals
            {
                if meal?.date == theDate
                {
                total += (meal?.calories)!
                }
            }
            return total
        }
    }
    
    var getMealCount : Int
    {
        var theDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let currentDayString = dateFormatter.string(from: theDate)  //changing the format of my date
        theDate = dateFormatter.date(from: currentDayString)! //making new format a date
        
        var total = 0
        if meals.isEmpty == true
        {
            return total
        }
        else
        {
            for meal in meals
            {
                if meal?.date == theDate
                {
                    total += 1
                }
            }
            return total
        }
    }
    
    var getDailyAverage: Double
    {
        var theDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let currentDayString = dateFormatter.string(from: theDate)  //changing the format of my date
        theDate = dateFormatter.date(from: currentDayString)! //making new format a date
        
        var total = 0.0
        var numberOfItems = 0.0
        if meals.isEmpty == true
        {
            return total
        }
        else
        {
            for meal in meals
            {
                if meal?.date == theDate
                {
                    total += (meal?.calories)!
                    numberOfItems += 1
                }
            }
            return (total/numberOfItems)
        }
    }
    
    var getWeeklyAverage: Double
    {
        var theDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let currentDayString = dateFormatter.string(from: theDate)  //changing the format of my date
        theDate = dateFormatter.date(from: currentDayString)! //making new format a date
        
        var total = 0.0
        var numberOfItems = 0.0
        if meals.isEmpty == true
        {
            return total
        }
        else
        {
            let aWeek: Double = 60 * 60 * 24 * 7
            for meal in meals
            {
                if (meal?.date)! <= theDate && (meal?.date)! >= theDate.addingTimeInterval(-(Double(aWeek)))
                {
                    total += (meal?.calories)!
                    numberOfItems += 1
                }
            }
            return (total/numberOfItems)
        }
    }
    var getBiWeeklyAverage: Double
    {
        var theDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let currentDayString = dateFormatter.string(from: theDate)  //changing the format of my date
        theDate = dateFormatter.date(from: currentDayString)! //making new format a date
        
        var total = 0.0
        var numberOfItems = 0.0
        if meals.isEmpty == true
        {
            return total
        }
        else
        {
            let twoWeeks: Double = 60 * 60 * 24 * 14
            for meal in meals
            {
                if (meal?.date)! <= theDate && (meal?.date)! >= theDate.addingTimeInterval(-(Double(twoWeeks)))
                {
                    total += (meal?.calories)!
                    numberOfItems += 1
                }
            }
            return (total/numberOfItems)
        }
    }
    
    
}

