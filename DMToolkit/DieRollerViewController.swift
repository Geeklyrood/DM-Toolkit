//
//  DieRollerViewController.swift
//  CharacterCreator
//
//  Created by Keenan Rood on 3/14/17.
//  Copyright © 2017 Keenan Rood. All rights reserved.
//

import UIKit
import Foundation

class DieRollViewController: UIViewController {
  
  @IBOutlet weak var d4ModText: UITextField!
  @IBOutlet weak var d6ModText: UITextField!
  @IBOutlet weak var d8ModText: UITextField!
  @IBOutlet weak var d10ModText: UITextField!
  @IBOutlet weak var d12ModText: UITextField!
  @IBOutlet weak var d20ModText: UITextField!
  @IBOutlet weak var d100ModText: UITextField!
  @IBOutlet weak var d10000ModText: UITextField!
  
  @IBOutlet weak var d4StepperValue: UILabel!
  @IBOutlet weak var d6StepperValue: UILabel!
  @IBOutlet weak var d8StepperValue: UILabel!
  @IBOutlet weak var d10StepperValue: UILabel!
  @IBOutlet weak var d12StepperValue: UILabel!
  @IBOutlet weak var d20StepperValue: UILabel!
  @IBOutlet weak var d100StepperValue: UILabel!
  @IBOutlet weak var d10000StepperValue: UILabel!
  
  @IBOutlet weak var d4Stepper: UIStepper!
  @IBOutlet weak var d6Stepper: UIStepper!
  @IBOutlet weak var d8Stepper: UIStepper!
  @IBOutlet weak var d10Stepper: UIStepper!
  @IBOutlet weak var d12Stepper: UIStepper!
  @IBOutlet weak var d20Stepper: UIStepper!
  @IBOutlet weak var d100Stepper: UIStepper!
  @IBOutlet weak var d10000Stepper: UIStepper!
  
  @IBOutlet weak var results: UILabel!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    d4Stepper.wraps = false
    d4Stepper.autorepeat = false
    d4Stepper.maximumValue = 20
    
    d6Stepper.wraps = false
    d6Stepper.autorepeat = false
    d6Stepper.maximumValue = 20
    
    d8Stepper.wraps = false
    d8Stepper.autorepeat = false
    d8Stepper.maximumValue = 20
    
    d10Stepper.wraps = false
    d10Stepper.autorepeat = false
    d10Stepper.maximumValue = 20
    
    d12Stepper.wraps = false
    d12Stepper.autorepeat = false
    d12Stepper.maximumValue = 20
    
    d20Stepper.wraps = false
    d20Stepper.autorepeat = false
    d20Stepper.maximumValue = 20
    
    d100Stepper.wraps = false
    d100Stepper.autorepeat = false
    d100Stepper.maximumValue = 20
    
    d10000Stepper.wraps = false
    d10000Stepper.autorepeat = false
    d10000Stepper.maximumValue = 20
    
    d4ModText.text = String(1)
    d6ModText.text = String(1)
    d8ModText.text = String(1)
    d10ModText.text = String(1)
    d12ModText.text = String(1)
    d20ModText.text = String(1)
    d100ModText.text = String(1)
    d10000ModText.text = String(1)
    
    d4ModText.keyboardType = UIKeyboardType.numberPad
    d6ModText.keyboardType = UIKeyboardType.numberPad
    d8ModText.keyboardType = UIKeyboardType.numberPad
    d10ModText.keyboardType = UIKeyboardType.numberPad
    d12ModText.keyboardType = UIKeyboardType.numberPad
    d20ModText.keyboardType = UIKeyboardType.numberPad
    d100ModText.keyboardType = UIKeyboardType.numberPad
    d10000ModText.keyboardType = UIKeyboardType.numberPad

    
    
  }
  
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    self.view.endEditing(true)
  }
  
  
  @IBAction func d4StepperModChanged(_ sender: UIStepper) {
    d4StepperValue.text = Int(sender.value).description
  }
  @IBAction func d6StepperModChanged(_ sender: UIStepper) {
    d6StepperValue.text = Int(sender.value).description
  }
  @IBAction func d8StepperModChanged(_ sender: UIStepper) {
    d8StepperValue.text = Int(sender.value).description
  }
  @IBAction func d10StepperModChanged(_ sender: UIStepper) {
    d10StepperValue.text = Int(sender.value).description
  }
  @IBAction func d12StepperModChanged(_ sender: UIStepper) {
    d12StepperValue.text = Int(sender.value).description
  }
  @IBAction func d20StepperModChanged(_ sender: UIStepper) {
    d20StepperValue.text = Int(sender.value).description
  }
  @IBAction func d100StepperModChanged(_ sender: UIStepper) {
    d100StepperValue.text = Int(sender.value).description
  }
  @IBAction func d10000StepperModChanged(_ sender: UIStepper) {
    d10000StepperValue.text = Int(sender.value).description
  }
  
  
  
  @IBAction func d4Roll(_ sender: UIButton) {
    
    
    var currentRoll = 0
    let rollTimes = Int(d4ModText.text!)
    var rollResult = [Int]()
    var dieRolls = ""
    var rollTotal = 0
    
    while currentRoll < Int(rollTimes!) {
      
      let dieRoll = arc4random_uniform(4) + 1
      
      rollResult.append(Int(dieRoll))
      
      if currentRoll == Int(rollTimes!) - 1 {
        dieRolls += String(rollResult[currentRoll])
      } else {
        dieRolls += String(rollResult[currentRoll]) + ", "
      }
      
      rollTotal += rollResult[currentRoll]
      rollTotal += Int(d4StepperValue.text!)!
      
      results.text = dieRolls + " + Mod(" + d4StepperValue.text! + ")\n" + String(rollTotal)
      currentRoll += 1
    }
    
  }
  
  @IBAction func d6Roll(_ sender: UIButton) {
    var currentRoll = 0
    let rollTimes = Int(d6ModText.text!)
    var rollResult = [Int]()
    var dieRolls = ""
    var rollTotal = 0
    
    while currentRoll < Int(rollTimes!) {
      
      let dieRoll = arc4random_uniform(6) + 1
      
      rollResult.append(Int(dieRoll))
      
      if currentRoll == Int(rollTimes!) - 1 {
        dieRolls += String(rollResult[currentRoll])
      } else {
        dieRolls += String(rollResult[currentRoll]) + ", "
      }
      
      rollTotal += rollResult[currentRoll]
      rollTotal += Int(d6StepperValue.text!)!
      
      results.text = dieRolls + " + Mod(" + d6StepperValue.text! + ")\n" + String(rollTotal)
      currentRoll += 1
    }
  }
  
  @IBAction func d8Roll(_ sender: UIButton) {
    var currentRoll = 0
    let rollTimes = Int(d8ModText.text!)
    var rollResult = [Int]()
    var dieRolls = ""
    var rollTotal = 0
    
    while currentRoll < Int(rollTimes!) {
      
      let dieRoll = arc4random_uniform(8) + 1
      
      rollResult.append(Int(dieRoll))
      
      if currentRoll == Int(rollTimes!) - 1 {
        dieRolls += String(rollResult[currentRoll])
      } else {
        dieRolls += String(rollResult[currentRoll]) + ", "
      }
      
      rollTotal += rollResult[currentRoll]
      rollTotal += Int(d8StepperValue.text!)!
      
      results.text = dieRolls + " + Mod(" + d8StepperValue.text! + ")\n" + String(rollTotal)
      currentRoll += 1
    }
  }
  
  @IBAction func d10Roll(_ sender: UIButton) {
    var currentRoll = 0
    let rollTimes = Int(d10ModText.text!)
    var rollResult = [Int]()
    var dieRolls = ""
    var rollTotal = 0
    
    while currentRoll < Int(rollTimes!) {
      
      let dieRoll = arc4random_uniform(10) + 1
      
      rollResult.append(Int(dieRoll))
      
      if currentRoll == Int(rollTimes!) - 1 {
        dieRolls += String(rollResult[currentRoll])
      } else {
        dieRolls += String(rollResult[currentRoll]) + ", "
      }
      
      rollTotal += rollResult[currentRoll]
      rollTotal += Int(d10StepperValue.text!)!
      
      results.text = dieRolls + " + Mod(" + d10StepperValue.text! + ")\n" + String(rollTotal)
      currentRoll += 1
    }
  }
  
  @IBAction func d12Roll(_ sender: UIButton) {
    var currentRoll = 0
    let rollTimes = Int(d12ModText.text!)
    var rollResult = [Int]()
    var dieRolls = ""
    var rollTotal = 0
    
    while currentRoll < Int(rollTimes!) {
      
      let dieRoll = arc4random_uniform(12) + 1
      
      rollResult.append(Int(dieRoll))
      
      if currentRoll == Int(rollTimes!) - 1 {
        dieRolls += String(rollResult[currentRoll])
      } else {
        dieRolls += String(rollResult[currentRoll]) + ", "
      }
      
      rollTotal += rollResult[currentRoll]
      rollTotal += Int(d12StepperValue.text!)!
      
      results.text = dieRolls + " + Mod(" + d12StepperValue.text! + ")\n" + String(rollTotal)
      currentRoll += 1
    }
  }
  
  @IBAction func d20Roll(_ sender: UIButton) {
    var currentRoll = 0
    let rollTimes = Int(d20ModText.text!)
    var rollResult = [Int]()
    var dieRolls = ""
    var rollTotal = 0
    
    while currentRoll < Int(rollTimes!) {
      
      let dieRoll = arc4random_uniform(20) + 1
      
      rollResult.append(Int(dieRoll))
      
      if currentRoll == Int(rollTimes!) - 1 {
        dieRolls += String(rollResult[currentRoll])
      } else {
        dieRolls += String(rollResult[currentRoll]) + ", "
      }
      
      rollTotal += rollResult[currentRoll]
      rollTotal += Int(d20StepperValue.text!)!
      
      results.text = dieRolls + " + Mod(" + d20StepperValue.text! + ")\n" + String(rollTotal)
      currentRoll += 1
    }
  }
  
  @IBAction func d100Roll(_ sender: UIButton) {
    var currentRoll = 0
    let rollTimes = Int(d100ModText.text!)
    var rollResult = [Int]()
    var dieRolls = ""
    var rollTotal = 0
    
    while currentRoll < Int(rollTimes!) {
      
      let dieRoll = arc4random_uniform(100) + 1
      
      rollResult.append(Int(dieRoll))
      
      if currentRoll == Int(rollTimes!) - 1 {
        dieRolls += String(rollResult[currentRoll])
      } else {
        dieRolls += String(rollResult[currentRoll]) + ", "
      }
      
      rollTotal += rollResult[currentRoll]
      rollTotal += Int(d100StepperValue.text!)!
      
      results.text = dieRolls + " + Mod(" + d100StepperValue.text! + ")\n" + String(rollTotal)
      currentRoll += 1
    }
  }
  
  @IBAction func d10000Roll(_ sender: UIButton) {
    var currentRoll = 0
    let rollTimes = Int(d10000ModText.text!)
    var rollResult = [Int]()
    var dieRolls = ""
    var rollTotal = 0
    
    while currentRoll < Int(rollTimes!) {
      
      let dieRoll = arc4random_uniform(10000) + 1
      
      rollResult.append(Int(dieRoll))
      
      if currentRoll == Int(rollTimes!) - 1 {
        dieRolls += String(rollResult[currentRoll])
      } else {
        dieRolls += String(rollResult[currentRoll]) + ", "
      }
      
      rollTotal += rollResult[currentRoll]
      rollTotal += Int(d10000StepperValue.text!)!
      
      results.text = dieRolls + " + Mod(" + d10000StepperValue.text! + ")\n" + String(rollTotal)
      currentRoll += 1
    }
  }
  
  override func encodeRestorableState(with coder: NSCoder) {
    coder.encode(d4ModText.text, forKey: "d4Mod")
    coder.encode(d6ModText.text, forKey: "d6Mod")
    coder.encode(d8ModText.text, forKey: "d8Mod")
    coder.encode(d10ModText.text, forKey: "d10Mod")
    coder.encode(d12ModText.text, forKey: "d12Mod")
    coder.encode(d20ModText.text, forKey: "d20Mod")
    coder.encode(d100ModText.text, forKey: "d100Mod")
    coder.encode(d10000ModText.text, forKey: "d10000Mod")
    
    coder.encode(d4StepperValue.text, forKey: "d4Stepper")
    coder.encode(d6StepperValue.text, forKey: "d6Stepper")
    coder.encode(d8StepperValue.text, forKey: "d8Stepper")
    coder.encode(d10StepperValue.text, forKey: "d10Stepper")
    coder.encode(d12StepperValue.text, forKey: "d12Stepper")
    coder.encode(d20StepperValue.text, forKey: "d20Stepper")
    coder.encode(d100StepperValue.text, forKey: "d100Stepper")
    coder.encode(d10000StepperValue.text, forKey: "d10000Stepper")
    coder.encode(results.text, forKey: "results")
    
    super.encodeRestorableState(with: coder)
    
  }
  
  override func decodeRestorableState(with coder: NSCoder) {
    if let d4mod = coder.decodeObject(forKey: "d4Mod") as? String {
      d4ModText.text = d4mod
    }
    if let d6mod = coder.decodeObject(forKey: "d6Mod") as? String {
      d6ModText.text = d6mod
    }
    if let d8mod = coder.decodeObject(forKey: "d8Mod") as? String {
      d8ModText.text = d8mod
    }
    if let d10mod = coder.decodeObject(forKey: "d10Mod") as? String {
      d10ModText.text = d10mod
    }
    if let d12mod = coder.decodeObject(forKey: "d12Mod") as? String {
      d12ModText.text = d12mod
    }
    if let d20mod = coder.decodeObject(forKey: "d20Mod") as? String {
      d20ModText.text = d20mod
    }
    if let d100mod = coder.decodeObject(forKey: "d100Mod") as? String {
      d100ModText.text = d100mod
    }
    if let d10000mod = coder.decodeObject(forKey: "d10000Mod") as? String {
      d10000ModText.text = d10000mod
    }
    
    if let d4StepperSaved = coder.decodeObject(forKey: "d4Stepper") as? String {
      d4StepperValue.text = d4StepperSaved
    }
    if let d6StepperSaved = coder.decodeObject(forKey: "d6Stepper") as? String {
      d6StepperValue.text = d6StepperSaved
    }
    if let d8StepperSaved = coder.decodeObject(forKey: "d8Stepper") as? String {
      d8StepperValue.text = d8StepperSaved
    }
    if let d10StepperSaved = coder.decodeObject(forKey: "d10Stepper") as? String {
      d10StepperValue.text = d10StepperSaved
    }
    if let d12StepperSaved = coder.decodeObject(forKey: "d12Stepper") as? String {
      d12StepperValue.text = d12StepperSaved
    }
    if let d20StepperSaved = coder.decodeObject(forKey: "d20Stepper") as? String {
      d20StepperValue.text = d20StepperSaved
    }
    if let d100StepperSaved = coder.decodeObject(forKey: "d100Stepper") as? String {
      d100StepperValue.text = d100StepperSaved
    }
    if let d10000StepperSaved = coder.decodeObject(forKey: "d10000Stepper") as? String {
      d10000StepperValue.text = d10000StepperSaved
    }
    if let resultsText = coder.decodeObject(forKey: "results") as? String {
      results.text = resultsText
    }
    
    super.decodeRestorableState(with: coder)
  }
  
  
}
