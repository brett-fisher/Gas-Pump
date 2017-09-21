//
//  ViewController.swift
//  Gas Pump
//
//  Created by Brett Fisher on 9/20/17.
//  Copyright © 2017 Fish. All rights reserved.
//

import UIKit
import Foundation

class GasPumpViewController: UIViewController {

  var price = 0.0
  var gallons = 0.0
  var priceCounter = Timer()
  var galCounter = Timer()
  
  // Initially hidden
  @IBOutlet weak var currentSaleLabel: UILabel!
  @IBOutlet weak var currentGallonsLabel: UILabel!
  //
  @IBOutlet weak var instructionsLabel: UILabel!
  
  @IBAction func insertCardPressed(_ sender: Any) {
    displayPINPad()
  }
  
  @IBAction func pumpGasPressed(_ sender: Any) {
    startPumpingGas()
  }
  
  @IBAction func stopPressed(_ sender: Any) {
    stop()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    currentSaleLabel.text = String(price)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }

}

