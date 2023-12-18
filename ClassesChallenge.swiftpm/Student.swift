//
//  Student.swift
//  ClassesChallenge
//
//  Created by Robert Englund
//  Copyright © 2022 MobileMakersEdu. All rights reserved.
//


// MARK: MVP - Part I
class Student {
    var firstName: String = "Omay"
    var lastName: String = "Maculo"
    // MARK: Stretch #1 - Part I
    var idNumber: String = ""
    var favoriteColor: String = ""
    
    init () {
        self.idNumber = "84007"
        self.favoriteColor = "Cyan"
    }
    // MARK: Stretch #2 - Part I
    init (firstName: String, lastName: String, idNumber: String, favoriteColor: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.idNumber = idNumber
        self.favoriteColor = favoriteColor
    }
    // MARK: - Stretch #3 - Part I
    func sayHello () -> String {
        return "Hello \(firstName) \(lastName), your id number is \(idNumber)"
    }
}
