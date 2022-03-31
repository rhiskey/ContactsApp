//
//  Person.swift
//  ContactsApp
//
//  Created by Владимир Киселев on 31.03.2022.
//

import Foundation

struct Person {
    let name: String
    let surname: String
    let phone: String
    let email: String

    var fullName: String {
        "\(name) \(surname)"
    }
}

struct PersonList {
    static func getPersonList() -> [Person] {
        let dm = DataManager()
        
        var persons: [Person] = []
        
        dm.names.forEach {
            name in
            let randomName = dm.names.randomElement()!
            let randomSurname = dm.surnames.randomElement()!
            let randomPhone = dm.phones.randomElement()!
            let randomEmail = dm.emails.randomElement()!
            
            let user = Person(
                name: randomName,
                surname: randomSurname,
                phone: randomPhone,
                email: randomEmail
            )
            persons.append(user)
        }
        return persons
        
    }
}
