//
//  RidersViewController.swift
//  codable-json
//
//  Created by Kyle Hilla on 5/13/21.
//

import UIKit

class RidersViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var riderTableView: UITableView!
    
    var riderArray = [Rider]()
    
    var selectedRider: Rider?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        riderTableView.tableFooterView = UIView()
        
        let jsonData = json.data(using: .utf8) ?? Data()
        
        let decoder = JSONDecoder()
        
        do {
            let riderList = try decoder.decode(RiderList.self, from: jsonData)
            riderArray = riderList.riders
        } catch {
            print(error)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return riderArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        
        cell = riderTableView.dequeueReusableCell(withIdentifier: "RiderCell", for: indexPath)
        
        let riderData = riderArray[indexPath.row] as Rider
        
        cell.textLabel?.text = riderData.type
        cell.detailTextLabel?.text = riderData.subtext
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let riderData = riderArray[indexPath.row] as Rider
        
        selectedRider = riderData
        
        performSegue(withIdentifier: "FaresSegue", sender: self)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "FaresSegue" {
            if let destinationController = segue.destination as? FaresViewController {
                destinationController.selectedRider = selectedRider
            }
        }
    }
}
