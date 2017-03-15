//
//  ViewController.swift
//  CharacterCreator
//
//  Created by Keenan Rood on 10/13/16.
//  Copyright © 2016 Keenan Rood. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
  
  @IBOutlet weak var characterName: UITextField!
  @IBOutlet weak var playerName: UITextField!
  
  @IBOutlet weak var characterClass: UIPickerView!
  @IBOutlet weak var characterRace: UIPickerView!
  
  @IBOutlet weak var strText: UITextField!
  @IBOutlet weak var dexText: UITextField!
  @IBOutlet weak var conText: UITextField!
  @IBOutlet weak var intText: UITextField!
  @IBOutlet weak var wisText: UITextField!
  @IBOutlet weak var chaText: UITextField!
  @IBOutlet weak var strMod: UILabel!
  @IBOutlet weak var dexMod: UILabel!
  @IBOutlet weak var conMod: UILabel!
  @IBOutlet weak var intMod: UILabel!
  @IBOutlet weak var wisMod: UILabel!
  @IBOutlet weak var chaMod: UILabel!
  
  
  var selectedClass: Int = 0
  var selectedRace: Int = 0
  var characterNameSeq = ""
  var playerNameSeq = ""
  
  var characterClassData: [String] = [String]()
  var characterRaceData: [String] = [String]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    characterRaceData = ["Dragonborn", "Mountain Dwarf", "High Elf", "Rock Gnome", "Half-Elf", "Half-Orc", "Lightfoot Halfling", "Human",  "Tiefling", ]
    characterClassData = ["Barbarian", "Bard", "Cleric", "Druid", "Fighter", "Monk", "Paladin", "Ranger", "Rogue", "Sorcerer", "Warlock", "Wizard"]
    
    self.characterRace.dataSource = self
    self.characterRace.delegate = self
    
    self.characterClass.dataSource = self
    self.characterClass.delegate = self
  }
  
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
  }
  
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    
    if (pickerView == self.characterClass) {
      return characterClassData.count;
    }
    else if (pickerView == self.characterRace) {
      return characterRaceData.count;
    }
    else {
      return 0;
    }
    
  }
  
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    
    if (pickerView == self.characterClass) {
      return characterClassData[row]
    }
    else if (pickerView == self.characterRace) {
      return characterRaceData[row]
    }
    else {
      
      return "";
    }
  }
  
  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    
    if (pickerView == self.characterClass) {
      selectedClass = row
    }
    else if (pickerView == self.characterRace) {
      selectedRace = row
    }
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  @IBAction func rollStats(_ sender: AnyObject) {
    
    diceRoll()
    
  }
  
  func diceRoll() {
    
    var currentStatIndex = 0
    
    var firstRoll: Int = 0
    var secondRoll: Int = 0
    var thirdRoll: Int = 0
    var fourthRoll: Int = 0
    var totalRoll: Int = 0
    var smallestRoll: Int = 0
    var finalRoll: Int = 0
    
    
    while currentStatIndex < 6 {
      var currentDieIndex = 0
      while currentDieIndex < 4 {
        
        let diceRoll = arc4random_uniform(6) + 1
        
        
        if currentDieIndex == 0 {
          
          if Int(diceRoll) == 1 {
            firstRoll = Int(diceRoll)
          }
        } else if currentDieIndex == 1 {
          secondRoll = Int(diceRoll)
        } else if currentDieIndex == 2 {
          thirdRoll = Int(diceRoll)
        } else if currentDieIndex == 3 {
          fourthRoll = Int(diceRoll)
        }
        
        totalRoll = firstRoll + secondRoll + thirdRoll + fourthRoll
        
        smallestRoll = min(firstRoll, secondRoll, thirdRoll, fourthRoll)
        
        finalRoll = totalRoll - smallestRoll
        
        currentDieIndex += 1
      }
      
      var totalWithMod = finalRoll
      
      if currentStatIndex == 0 {
        
        if characterRaceData[selectedRace] == "Human" {
          totalWithMod += 1
          
          strText.text = String(totalWithMod)
        } else if characterRaceData[selectedRace] == "Dragonborn" {
          totalWithMod += 2
          
          strText.text = String(totalWithMod)
        } else if characterRaceData[selectedRace] == "Mountain Dwarf" {
          totalWithMod += 2
          strText.text = String(totalWithMod)
        } else {
          strText.text = String(totalWithMod)
        }
        strMod.text = String(getMod(totalWithMod))
      } else if currentStatIndex == 1 {
        if characterRaceData[selectedRace] == "Human" {
          totalWithMod += 1
          
          dexText.text = String(totalWithMod)
          
        } else if characterRaceData[selectedRace] == "High Elf" {
          totalWithMod += 2
          
          dexText.text = String(totalWithMod)
        } else {
          dexText.text = String(totalWithMod)
        }
        dexMod.text = String(getMod(totalWithMod))
      } else if currentStatIndex == 2 {
        if characterRaceData[selectedRace] == "Human" {
          totalWithMod += 1
          
          conText.text = String(totalWithMod)
          
        } else if characterRaceData[selectedRace] == "Mountain Dwarf" {
          totalWithMod += 2
          conText.text = String(totalWithMod)
        } else if characterRaceData[selectedRace] == "Rock Gnome" {
          totalWithMod += 1
          conText.text = String(totalWithMod)
        } else {
          conText.text = String(totalWithMod)
        }
        conMod.text = String(getMod(totalWithMod))
      } else if currentStatIndex == 3 {
        if characterRaceData[selectedRace] == "Human" {
          totalWithMod += 1
          
          intText.text = String(totalWithMod)
          
        } else if characterRaceData[selectedRace] == "Tiefling" {
          totalWithMod += 1
          intText.text = String(totalWithMod)
        } else if characterRaceData[selectedRace] == "High Elf" {
          totalWithMod += 1
          intText.text = String(totalWithMod)
        } else if characterRaceData[selectedRace] == "Rock Elf" {
          totalWithMod += 2
          intText.text = String(totalWithMod)
        } else {
          intText.text = String(totalWithMod)
        }
        intMod.text = String(getMod(totalWithMod))
      } else if currentStatIndex == 4 {
        if characterRaceData[selectedRace] == "Human" {
          totalWithMod += 1
          
          wisText.text = String(totalWithMod)
          
        } else {
          wisText.text = String(totalWithMod)
        }
        wisMod.text = String(getMod(totalWithMod))
      } else if currentStatIndex == 5 {
        if characterRaceData[selectedRace] == "Human" {
          totalWithMod += 1
          
          chaText.text = String(totalWithMod)
          
        } else if characterRaceData[selectedRace] == "Dragonborn" {
          totalWithMod += 1
          chaText.text = String(totalWithMod)
          
        } else if characterRaceData[selectedRace] == "Tiefling" {
          totalWithMod += 2
          chaText.text = String(totalWithMod)
        } else {
          chaText.text = String(totalWithMod)
        }
        chaMod.text = String(getMod(totalWithMod))
      }
      
      currentStatIndex += 1
    }
    
  }
  
  func getMod(_ totalWithMod: Int) -> Int {
    var mod: Int = 0
    
    if totalWithMod == 3 {
      mod = -4
    } else if totalWithMod == 4 || totalWithMod == 5 {
      mod = -3
    } else if totalWithMod == 6 || totalWithMod == 7 {
      mod = -2
    } else if totalWithMod == 8 || totalWithMod == 9 {
      mod = -1
    } else if totalWithMod == 10 || totalWithMod == 11 {
      mod = 0
    } else if totalWithMod == 12 || totalWithMod == 13 {
      mod = 1
    } else if totalWithMod == 14 || totalWithMod == 15 {
      mod = 2
    } else if totalWithMod == 16 || totalWithMod == 17 {
      mod = 3
    } else if totalWithMod == 18 || totalWithMod == 19 {
      mod = 4
    } else if totalWithMod == 20 {
      mod = 5
    }
    return mod
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let destination = segue.destination as? ResponseViewController {
      destination.playerName = playerName.text
      destination.characterName = characterName.text
      destination.characterClass = characterClassData[selectedClass]
      destination.characterRace = characterRaceData[selectedRace]
      destination.str = strText.text
      destination.dex = dexText.text
      destination.con = conText.text
      destination.int = intText.text
      destination.wis = wisText.text
      destination.cha = chaText.text
      destination.strMod = strMod.text
      destination.dexMod = dexMod.text
      destination.conMod = conMod.text
      destination.intMod = intMod.text
      destination.wisMod = wisMod.text
      destination.chaMod = chaMod.text
    }
  }
  
  
  
  @IBAction func createCharacter(_ sender: AnyObject) {
    if (characterName.hasText && playerName.hasText) {
      
    } else {
      let alert = UIAlertController(title: "Error", message: "You must complete all fields before submitting", preferredStyle: .alert)
      let dismissHandler = {
        (action: UIAlertAction!) in
        self.dismiss(animated: true, completion: nil)
      }
      let OKAction = UIAlertAction(title: "OK", style: .default, handler: dismissHandler)
      
      
      alert.addAction(OKAction)
      
      self.present(alert, animated: true, completion: nil)
    }
    
  }
  
  override func encodeRestorableState(with coder: NSCoder) {
    
    coder.encode(characterName.text, forKey: "characterName")
    coder.encode(playerName.text, forKey: "playerName")
    coder.encode(strText.text, forKey: "str")
    coder.encode(dexText.text, forKey: "dex")
    coder.encode(conText.text, forKey: "con")
    coder.encode(wisText.text, forKey: "wis")
    coder.encode(intText.text, forKey: "int")
    coder.encode(chaText.text, forKey: "cha")
    coder.encode(strMod.text, forKey: "strMod")
    coder.encode(dexMod.text, forKey: "dexMod")
    coder.encode(conMod.text, forKey: "conMod")
    coder.encode(wisMod.text, forKey: "wisMod")
    coder.encode(intMod.text, forKey: "intMod")
    coder.encode(chaMod.text, forKey: "chaMod")
    
    super.encodeRestorableState(with: coder)
    
    
  }
  
  override func decodeRestorableState(with coder: NSCoder) {
    
    if let charName = coder.decodeObject(forKey: "characterName") as? String {
      characterName.text = charName
    }
    if let playName = coder.decodeObject(forKey: "playerName") as? String {
      playerName.text = playName
    }
    if let str = coder.decodeObject(forKey: "str") as? String {
      strText.text = str
    }
    if let dex = coder.decodeObject(forKey: "dex") as? String {
      dexText.text = dex
    }
    if let con = coder.decodeObject(forKey: "con") as? String {
      conText.text = con
    }
    if let wis = coder.decodeObject(forKey: "wis") as? String {
      wisText.text = wis
    }
    if let int = coder.decodeObject(forKey: "int") as? String {
      intText.text = int
    }
    if let cha = coder.decodeObject(forKey: "cha") as? String {
      chaText.text = cha
    }
    if let strM = coder.decodeObject(forKey: "strMod") as? String {
      strMod.text = strM
    }
    if let dexM = coder.decodeObject(forKey: "dexMod") as? String {
      dexMod.text = dexM
    }
    if let conM = coder.decodeObject(forKey: "conMod") as? String {
      conMod.text = conM
    }
    if let wisM = coder.decodeObject(forKey: "wisMod") as? String {
      wisMod.text = wisM
    }
    if let intM = coder.decodeObject(forKey: "intMod") as? String {
      intMod.text = intM
    }
    if let chaM = coder.decodeObject(forKey: "chaMod") as? String {
      chaMod.text = chaM
    }
    
    super.decodeRestorableState(with: coder)
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    self.view.endEditing(true)
  }
  
}

