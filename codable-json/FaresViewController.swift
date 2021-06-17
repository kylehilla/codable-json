//
//  FaresViewController.swift
//  codable-json
//
//  Created by Kyle Hilla on 5/13/21.
//

import UIKit

class FaresViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var faresTableView: UITableView!
    
    var selectedRider: Rider?
    var selectedFare: Fare?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        faresTableView.tableFooterView = UIView()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedRider?.fares.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        
        cell = faresTableView.dequeueReusableCell(withIdentifier: "FareCell", for: indexPath)
        
        let faresData = selectedRider?.fares[indexPath.row]
        
        cell.textLabel?.text = faresData?.description

        if let priceString = faresData?.price
        {
            cell.detailTextLabel?.text = String(format: "$%.2f", priceString)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let faresData = selectedRider?.fares[indexPath.row]
        
        selectedFare = faresData
        
        performSegue(withIdentifier: "PurchaseSegue", sender: self)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PurchaseSegue" {
            if let destinationController = segue.destination as? PurchaseViewController {
                destinationController.selectedRider = selectedRider
                destinationController.selectedFare = selectedFare
            }
        }
    }
}
