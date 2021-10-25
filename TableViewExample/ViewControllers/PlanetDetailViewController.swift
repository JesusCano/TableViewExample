//
//  PlanetDetailViewController.swift
//  TableViewExample
//
//  Created by Jesus Jaime Cano Terrazas on 10/07/21.
//

import UIKit

class PlanetDetailViewController: UIViewController {
    
    var planet: Planet!
    
    @IBOutlet weak var planetTitleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        planetTitleLabel.text = planet.name
        descriptionLabel.text = planet.description
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
