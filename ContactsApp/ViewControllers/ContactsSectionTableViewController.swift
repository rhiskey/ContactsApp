//
//  ContactsSectionTableViewController.swift
//  ContactsApp
//
//  Created by Владимир Киселев on 31.03.2022.
//

import UIKit


class ContactsSectionTableViewController: UITableViewController {
    var personsList: [Person]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = editButtonItem
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        personsList.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection
                            section: Int) -> String? {
        "\(personsList[section].fullName)"
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personID", for: indexPath)
        var content = cell.defaultContentConfiguration()
        
        let person = personsList[indexPath.section]

        content.text = person.phone
        content.image = .add
        content.secondaryText = person.email
        
        cell.contentConfiguration = content
        return cell
    }

    // MARK: - Table view delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let person = personsList[indexPath.section]
        performSegue(withIdentifier: "showPersonDetails", sender: person)
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        .none
    }
    
    override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        false
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let currentPerson = personsList.remove(at: sourceIndexPath.row)
        personsList.insert(currentPerson, at: destinationIndexPath.row)
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let personDetailsVC = segue.destination as? PersonDetailsViewController else { return }
        personDetailsVC.person = sender as? Person
    }
    
}
