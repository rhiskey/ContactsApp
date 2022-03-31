//
//  TabBarViewController.swift
//  ContactsApp
//
//  Created by Владимир Киселев on 31.03.2022.
//

import UIKit

class TabBarViewController: UITabBarController {
    private var personsList = PersonList.getPersonList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarController = segue.destination as? UITabBarController else { return }
        guard let viewControllers = tabBarController.viewControllers else { return }
        
        
        viewControllers.forEach {
            if let personDetailsExtendedVC = $0 as? PersonDetailsExtendedTableViewController {
                personDetailsExtendedVC.personsList = personsList
            } else if let navigationVC = $0 as? UINavigationController {
                let personListVC = navigationVC.topViewController as! PersonsListTableViewController
                personListVC.personsList = personsList
            }
//            else if let personDetailsExtVC = $0 as? PersonDetailsExtendedTableViewController {
//                personDetailsExtVC.personsList = personsList
//            }
        }
        
    }
}
