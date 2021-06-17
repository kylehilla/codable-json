//
//  PurchaseViewController.swift
//  codable-json
//
//  Created by Kyle Hilla on 5/13/21.
//

import UIKit

class PurchaseViewController: UIViewController {
    
    @IBOutlet weak var riderLabel: UILabel!
    @IBOutlet weak var fareLabel: UILabel!
    
    @IBOutlet weak var fareStepper: UIStepper!
    
    @IBOutlet weak var purchaseButton: UIButton!
    
    var totalString = String()
    
    var selectedRider: Rider?
    var selectedFare: Fare?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        riderLabel.text = selectedRider?.type
        fareLabel.text = selectedFare?.description

        fareStepper.value = 1
        
        fareStepper.wraps = false
        fareStepper.minimumValue = 1
        fareStepper.stepValue = 1
        
        purchaseButton.layer.cornerRadius = 10.0
        
        updateButtonLabel()
    }
    
    @IBAction func fareStepperValueChanged(_ sender: Any) {
        updateButtonLabel()
    }
    
    func updateButtonLabel() {
        if let priceString = selectedFare?.price {
            totalString = String(format: "$%.2f", fareStepper.value * priceString)
        }
        
        if fareStepper.value == 1 {
            totalString = "Buy \(Int(fareStepper.value)) Ticket = \(totalString)"
        }
        else {
            totalString = "Buy \(Int(fareStepper.value)) Tickets = \(totalString)"
        }
        
        DispatchQueue.main.async {
            self.purchaseButton.setTitle(self.totalString, for: .normal)
        }
    }
}
