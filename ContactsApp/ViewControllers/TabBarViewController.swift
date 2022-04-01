//
//  TabBarViewController.swift
//  ContactsApp
//
//  Created by Владимир Киселев on 31.03.2022.
//

import UIKit


class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Contacts"
        setupViewControllers()
    }

    private func setupViewControllers() {
        let persons = PersonList.getPersonList()
        let contactVC = viewControllers?.first as! ContactsTableViewController
        let sectionVC = viewControllers?.last as! ContactsSectionTableViewController
        
        contactVC.persons = persons
        sectionVC.personsList = persons
    }
}
