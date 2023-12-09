//
//  NextViewController.swift
//  hw3
//
//  Created by Catherine Dana on 4/3/21.
//

import UIKit

class NextViewController: UIViewController {
    var teamName: String = ""
    var teamMascot: String = ""
    var teamCity: String = ""
    
  
    @IBOutlet weak var teamCityLbl: UILabel!
    @IBOutlet weak var teamMascotLbl: UILabel!
    @IBOutlet weak var teamNameLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        teamNameLbl.text = teamName
        teamMascotLbl.text = teamMascot
        teamCityLbl.text = teamCity
        

    
        // Do any additional setup after loading the view.
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


