//
//  User.swift
//  LogIn
//
//  Created by MAC  on 13.03.2022.
//

import Foundation

struct User {
    let username: String
    let password: String
    let person: Person
    
    static func getUserData() -> User {
        User(username: "Marat", password: "1234", person: .getPerson())
    }
}

struct Person {
    let name: String
    let surname: String
    let age: Int
    let city: String
    let hobby: String
    let workingPosition: String
    let image: String
    
    var fullName: String {
        "\(name) \(surname)"
    }
    
    static func getPerson() -> Person {
        Person(
            name: "Marat",
            surname: "Khayrullin",
            age: 24,
            city: "Saint-Petersburg",
            hobby: "Online poker",
            workingPosition: "Manager",
            image: "myFoto"
        )
    }
}
