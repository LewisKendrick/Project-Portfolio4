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
    }
    
    init(iUserID: String, iIconID: Int, iName: String, iGroupName: String, iWeight: Double, iBirthday: Date?, iGoal:Goal, iDailyAverage: Double, iWeeklyAverage: Double, iBiWeeklyAverage: Double, iCurrentCalories: Double)
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
    }
    
    
}

