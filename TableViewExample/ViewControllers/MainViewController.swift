//
//  MainViewController.swift
//  TableViewExample
//
//  Created by Jesus Jaime Cano Terrazas on 03/07/21.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var editTable: UIBarButtonItem!
    
    private var planetsArray: [Planet] = []
    private var studentsArrray: [Student] = []
    
    
    
    // MARK: My own way
    // private var headerTitles = ["Planets", "Countries"]
    // private var countriesArray: [Country] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.createData()
        
        // MARK: My own way
//        self.createCountries()
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "PlanetDetailViewController" {
            let planetDetailViewController = segue.destination as! PlanetDetailViewController
            
            if let planet = sender as? Planet {
                planetDetailViewController.planet = planet
            }
        }
    }
    
    // MARK: User interaction
    @IBAction func editButtonPressed(_ sender: UIBarButtonItem) {
        tableView.setEditing(!tableView.isEditing, animated: true)
        editTable.title = tableView.isEditing ? "Done" : "Edit"
    }
    
    
    //MARK: - Private Methods
    
    private func createData() {
        let planet = Planet(name: "Mercurio", description: "Descripcion de Mercurio")
        planetsArray.append(planet)
        
        planetsArray.append(Planet(name: "Venus", description: "Descripcion de Venus"))
        planetsArray.append(Planet(name: "Tierra", description: "Descripcion de Tierra"))
        planetsArray.append(Planet(name: "Marte", description: "Descripcion de Marte"))
        planetsArray.append(Planet(name: "Jupiter", description: "Descripcion de Jupiter"))
        planetsArray.append(Planet(name: "Saturno", description: "Descripcion de Saturno"))
        planetsArray.append(Planet(name: "Urano", description: "Descripcion de Urano"))
        planetsArray.append(Planet(name: "Neptuno", description: "Descripcion de Neptuno"))
        planetsArray.append(Planet(name: "Pluton", description: "Descripcion de Pluton"))
        planetsArray.append(Planet(name: "Jupiter", description: "Descripcion de Jupiter"))
        planetsArray.append(Planet(name: "Saturno", description: "Descripcion de Saturno"))
        planetsArray.append(Planet(name: "Urano", description: "Descripcion de Urano"))
        planetsArray.append(Planet(name: "Neptuno", description: "Descripcion de Neptuno"))
        planetsArray.append(Planet(name: "Pluton", description: "Descripcion de Pluton"))
        planetsArray.append(Planet(name: "Jupiter", description: "Descripcion de Jupiter"))
        planetsArray.append(Planet(name: "Saturno", description: "Descripcion de Saturno"))
        planetsArray.append(Planet(name: "Urano", description: "Descripcion de Urano"))
        planetsArray.append(Planet(name: "Neptuno", description: "Descripcion de Neptuno"))
        planetsArray.append(Planet(name: "Pluton", description: "Descripcion de Pluton"))
        
        studentsArrray.append(Student(name: "Miguel Gonzalez", programmingLanguage: .swift))
        studentsArrray.append(Student(name: "Miguel Olivares", programmingLanguage: .java))
        studentsArrray.append(Student(name: "Inberg Marcano", programmingLanguage: .kotlin))
        studentsArrray.append(Student(name: "Carlos Torres", programmingLanguage: .python))
        studentsArrray.append(Student(name: "Luis Gonzalez", programmingLanguage: .javaScript))
        studentsArrray.append(Student(name: "Jesus Cano", programmingLanguage: .javaScript))
        studentsArrray.append(Student(name: "Gilberto Soto", programmingLanguage: .javaScript))
        studentsArrray.append(Student(name: "Adrian Gonzalez", programmingLanguage: .kotlin))
        studentsArrray.append(Student(name: "Adrian Alba", programmingLanguage: .kotlin))
        studentsArrray.append(Student(name: "Miguel Gonzalez", programmingLanguage: .swift))
        studentsArrray.append(Student(name: "Miguel Olivares", programmingLanguage: .java))
        studentsArrray.append(Student(name: "Inberg Marcano", programmingLanguage: .kotlin))
        studentsArrray.append(Student(name: "Carlos Torres", programmingLanguage: .python))
        studentsArrray.append(Student(name: "Luis Gonzalez", programmingLanguage: .javaScript))
        studentsArrray.append(Student(name: "Jesus Cano", programmingLanguage: .javaScript))
        studentsArrray.append(Student(name: "Gilberto Soto", programmingLanguage: .javaScript))
        studentsArrray.append(Student(name: "Adrian Gonzalez", programmingLanguage: .kotlin))
        studentsArrray.append(Student(name: "Adrian Alba", programmingLanguage: .kotlin))
    }
    
    // MARK: My own way
    
//    private func createCountries() {
//        countriesArray.append(Country(name: "Mexico", continent: "America"))
//        countriesArray.append(Country(name: "China", continent: "Asiatico"))
//        countriesArray.append(Country(name: "España", continent: "Europa"))
//        countriesArray.append(Country(name: "Nigeria", continent: "Africa"))
//        countriesArray.append(Country(name: "New Zeland", continent: "Oceania"))
//    }
}

//MARK: -UITableViewDataSource, UITableViewDelegate

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    
    // With this func you can set as many rows will be in the whole table and frecuently it is the size of the principal array that brings all the data in it
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return planetsArray.count
        }
        return self.studentsArrray.count
        
        
        // MARK: My own way
//        var sizeOfTableView = 0
//        if section == 0 {
//            sizeOfTableView = self.planetsArray.count
//        } else if section == 1 {
//            sizeOfTableView = self.countriesArray.count
//        }
//
//        return sizeOfTableView
    }
    
    // This func is for setting the number of sections that will exists in the table, in this case, there is two
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
        
        
        // MARK: My own way
//        return self.headerTitles.count
    }
    
    // Right here is where you set the data from the array to the cell that you create, you can set things like title, and subtitle
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PlanetTableViewCell")!
            let item = self.planetsArray[indexPath.row]
            cell.textLabel?.text = item.name
            cell.accessoryType = .disclosureIndicator
            
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "StudentTableViewCell")!
        let item = self.studentsArrray[indexPath.row]
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = "\(item.programmingLanguage)"
        
        // MARK: My own way
//        if indexPath.section == 0 {
//            cell.textLabel?.text = self.planetsArray[indexPath.row].name
//        } else {
//            cell.textLabel?.text = self.countriesArray[indexPath.row].name
//        }
        return cell
    }
    
    // Set the title for each section, you can check what section is gonna be created and set the right title
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if section == 0 {
            return "Planets"
        }
        
        return "Students"
        
//        if section < self.headerTitles.count {
//            return self.headerTitles[section]
//        }
    }
    
    // ALwats that you what to do 
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Section: \(indexPath.section) Row: \(indexPath.row)")
        if indexPath.section == 0 {
            let planetTouched = self.planetsArray[indexPath.row]
            performSegue(withIdentifier: "PlanetDetailViewController", sender: planetTouched)
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        if indexPath.section == 0 {
            return false
        }
        
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            print("Delete row")
            studentsArrray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "Eliminar 🗑"
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        if indexPath.section == 0 {
            return false
        }
        
        return true
    }
    
    func tableView(_ tableView: UITableView, targetIndexPathForMoveFromRowAt sourceIndexPath: IndexPath, toProposedIndexPath proposedDestinationIndexPath: IndexPath) -> IndexPath {
        if sourceIndexPath.section != proposedDestinationIndexPath.section {
            return sourceIndexPath
        }
        
        return proposedDestinationIndexPath
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let studentToMove = self.studentsArrray[sourceIndexPath.row]
        studentsArrray.remove(at: sourceIndexPath.row)
        studentsArrray.insert(studentToMove, at: destinationIndexPath.row)
    }
    
    
}
