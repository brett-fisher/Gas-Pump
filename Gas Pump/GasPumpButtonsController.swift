//
//  GasPumpButtonsController.swift
//  Gas Pump
//
//  Created by Brett Fisher on 9/20/17.
//  Copyright © 2017 Fish. All rights reserved.
//

import Foundation
import UIKit

extension GasPumpViewController {
  
  func displayPINPad() {
    
    let pinDisplay = UIAlertController(title: "Enter PIN", message: "Please enter your 4-digit PIN", preferredStyle: .alert)
    let okAction = UIAlertAction(title: "Enter", style: .default, handler: { (alert: UIAlertAction!) in self.instructionsLabel.text = "Begin fueling" })
    let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
    
    pinDisplay.addAction(okAction)
    pinDisplay.addAction(cancelAction)
    pinDisplay.addTextField(configurationHandler: { textField in
      textField.keyboardType = .numberPad
    })
    
    show(pinDisplay, sender: AnyClass.self)
  }
  
  @objc func update() {
    gallons += 0.01
    price = gallons * 2.43
    currentGallonsLabel.text = String(format: "%.2f", gallons)
    currentSaleLabel.text = String(format: "%.2f", price)
  }
  
  func startPumpingGas() {
    if self.instructionsLabel.text == "Begin fueling" {
      galCounter = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(update), userInfo: nil, repeats: true)
    } else {
      let errorDisplay = UIAlertController(title: "Notice", message: "Please pay before fueling", preferredStyle: .alert)
      let errorAction = UIAlertAction(title: "Dismiss", style: .cancel, handler: nil)
      errorDisplay.addAction(errorAction)
      show(errorDisplay, sender: nil)
    }
  }
  
  func stop() {
    galCounter.invalidate()
  }
}
