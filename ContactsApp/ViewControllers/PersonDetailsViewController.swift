//
//  ViewController.swift
//  ContactsApp
//
//  Created by Владимир Киселев on 31.03.2022.
//

import UIKit

class PersonDetailsViewController: UIViewController {
    @IBOutlet var phoneLB: UILabel!
    @IBOutlet var emailLB: UILabel!
    
    var person: Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = person.fullName
        phoneLB.text = "Phone: \(person.phone)"
        emailLB.text = "Email: \(person.email)"
    }


}

