//
//  simplenetworkTableViewController.swift
//  hw3
//
//  Created by Catherine Dana on 23/2/21.
//

import UIKit
import Foundation

class simplenetworkTableViewController: UITableViewController {
    
    struct results: Codable {
        let results: [result]
    }
    
    struct result: Codable {
        let team, mascot, location, conference: String
        let division, league, abbreviation: String
    }
    var allTeams = [result]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.getAllData()
    }
    func getAllData() {
        print("hello")
        // get the data from the internet
        //let mySession = URLSession(configuration: URLSessionConfiguration.default)
        //let url = URL(string: "https://sportspage-feeds.p.rapidapi.com/teams?league=NBA")!
        //let task = mySession.dataTask(with: url) { data, response, error in
        let headers = [
            "x-rapidapi-key": "5a4f1b9cbamshbd089a76b628984p160f3bjsn40fd2f11f1d0",
            "x-rapidapi-host": "sportspage-feeds.p.rapidapi.com"
        ]

        let request = NSMutableURLRequest(url: NSURL(string: "https://sportspage-feeds.p.rapidapi.com/teams?league=NBA")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error)
//                DispatchQueue.main.async {
//                    let alert = UIAlertController(title: "Error - ", message: "\(error!)", preferredStyle: .alert)
//                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//                    self.present(alert, animated: true)
//                    return
//                }
            } else {
                guard let jsonData = data else {
                    print("No data")
                    return
                }
                do {
                    
                    let allFiles = try JSONDecoder().decode(results.self, from: jsonData)
                    self.allTeams = allFiles.results
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                    
                } catch {
                    print("JSONDecoder error : \(error )")
                }
                
                
            }
        })
        dataTask.resume()
        
        print("Data is loaded")
        }
        

        


    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return allTeams.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "playerCell", for: indexPath) as! TableViewCell

            // Configure the cell...
        cell.Title?.text = allTeams[indexPath.row].mascot
        cell.Detail?.text = String(allTeams[indexPath.row].division)
        
        cell.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
        
        return cell


    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let destVC = segue.destination as! NextViewController
        let selectRow = tableView.indexPathForSelectedRow?.row
        
        destVC.teamName = allTeams[selectRow!].mascot
        destVC.teamMascot = allTeams[selectRow!].location
        destVC.teamCity = allTeams[selectRow!].conference
    }

}
