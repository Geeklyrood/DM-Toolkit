//
//  ResponseView.swift
//  CharacterCreator
//
//  Created by Keenan Rood on 10/18/16.
//  Copyright © 2016 Keenan Rood. All rights reserved.
//

import UIKit

class ResponseViewController: UIViewController {
  
  @IBOutlet weak var responseLabel: UILabel!
  @IBOutlet weak var characterNameLabel: UILabel!
  @IBOutlet weak var playerNameLabel: UILabel!
  @IBOutlet weak var characterRaceLabel: UILabel!
  @IBOutlet weak var characterClassLabel: UILabel!
  @IBOutlet weak var strLabel: UILabel!
  @IBOutlet weak var dexLabel: UILabel!
  @IBOutlet weak var conLabel: UILabel!
  @IBOutlet weak var intLabel: UILabel!
  @IBOutlet weak var wisLabel: UILabel!
  @IBOutlet weak var chaLabel: UILabel!
  @IBOutlet weak var strModLabel: UILabel!
  @IBOutlet weak var dexModLabel: UILabel!
  @IBOutlet weak var conModLabel: UILabel!
  @IBOutlet weak var intModLabel: UILabel!
  @IBOutlet weak var wisModLabel: UILabel!
  @IBOutlet weak var chaModLabel: UILabel!
  
  var playerName: String?
  var characterClass: String?
  var characterName: String?
  var characterRace: String?
  var str: String?
  var dex: String?
  var con: String?
  var int: String?
  var wis: String?
  var cha: String?
  var strMod: String?
  var dexMod: String?
  var conMod: String?
  var intMod: String?
  var wisMod: String?
  var chaMod: String?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    if let playerName = playerName {
      responseLabel.text = "Hello \(playerName)! \nThank you for creating a character! \nHere are a few tools to help you in your game!"
      characterNameLabel.text = characterName
      playerNameLabel.text = playerName
      characterRaceLabel.text = characterRace
      characterClassLabel.text = characterClass
      strLabel.text = str
      dexLabel.text = dex
      conLabel.text = con
      wisLabel.text = wis
      intLabel.text = int
      chaLabel.text = cha
      strModLabel.text = strMod
      dexModLabel.text = dexMod
      conModLabel.text = conMod
      intModLabel.text = intMod
      wisModLabel.text = wisMod
      chaModLabel.text = chaMod
      
    } else {
      responseLabel.text = "You broke everything!"
    }
  }
  
  @IBAction func strRoll(_ sender: AnyObject) {
    
    let sRoll = Int(arc4random_uniform(20)) + 1 + Int(strMod!)!
    
    let alert = UIAlertController(title: "Roll", message: "You rolled a " + String(sRoll) + " for strength!", preferredStyle: .alert)
    
    
    let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
    
    alert.addAction(OKAction)
    
    self.present(alert, animated: true, completion: nil)
  }
  
  @IBAction func dexRoll(_ sender: AnyObject) {
    let sRoll = Int(arc4random_uniform(20)) + 1 + Int(dexMod!)!
    
    let alert = UIAlertController(title: "Roll", message: "You rolled a " + String(sRoll) + " for dexterity!", preferredStyle: .alert)
    let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
    
    alert.addAction(OKAction)
    
    self.present(alert, animated: true, completion: nil)
  }
  
  @IBAction func conRoll(_ sender: AnyObject) {
    let sRoll = Int(arc4random_uniform(20)) + 1 + Int(conMod!)!
    
    let alert = UIAlertController(title: "Roll", message: "You rolled a " + String(sRoll) + " for constitution!", preferredStyle: .alert)
    let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
    
    alert.addAction(OKAction)
    
    self.present(alert, animated: true, completion: nil)
  }
  
  @IBAction func intRoll(_ sender: AnyObject) {
    let sRoll = Int(arc4random_uniform(20)) + 1 + Int(intMod!)!
    
    let alert = UIAlertController(title: "Roll", message: "You rolled a " + String(sRoll) + " for intelligence!", preferredStyle: .alert)
    let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
    
    alert.addAction(OKAction)
    
    self.present(alert, animated: true, completion: nil)
  }
  
  @IBAction func wisRoll(_ sender: AnyObject) {
    let sRoll = Int(arc4random_uniform(20)) + 1 + Int(wisMod!)!
    
    let alert = UIAlertController(title: "Roll", message: "You rolled a " + String(sRoll) + " for wisdom!", preferredStyle: .alert)
    let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
    
    alert.addAction(OKAction)
    
    self.present(alert, animated: true, completion: nil)
  }
  
  @IBAction func chaRoll(_ sender: AnyObject) {
    let sRoll = Int(arc4random_uniform(20)) + 1 + Int(chaMod!)!
    
    let alert = UIAlertController(title: "Roll", message: "You rolled a " + String(sRoll) + " for charisma!", preferredStyle: .alert)
    let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
    
    alert.addAction(OKAction)
    
    self.present(alert, animated: true, completion: nil)
  }
  
  @IBAction func backButton(_ sender: UIButton) {
    self.dismiss(animated: true, completion: nil)
  }
  
  override func encodeRestorableState(with coder: NSCoder) {
    coder.encode(responseLabel.text, forKey: "response")
    coder.encode(characterNameLabel.text, forKey: "characterName")
    coder.encode(playerNameLabel.text, forKey: "playerName")
    coder.encode(characterClassLabel.text, forKey: "characterClass")
    coder.encode(characterRaceLabel.text, forKey: "characterRace")
    coder.encode(strLabel.text, forKey: "str")
    coder.encode(dexLabel.text, forKey: "dex")
    coder.encode(conLabel.text, forKey: "con")
    coder.encode(wisLabel.text, forKey: "wis")
    coder.encode(intLabel.text, forKey: "int")
    coder.encode(chaLabel.text, forKey: "cha")
    coder.encode(strModLabel.text, forKey: "strMod")
    coder.encode(dexModLabel.text, forKey: "dexMod")
    coder.encode(conModLabel.text, forKey: "conMod")
    coder.encode(wisModLabel.text, forKey: "wisMod")
    coder.encode(intModLabel.text, forKey: "intMod")
    coder.encode(chaModLabel.text, forKey: "chaMod")
    
    super.encodeRestorableState(with: coder)
  }
  
  override func decodeRestorableState(with coder: NSCoder) {
    if let response = coder.decodeObject(forKey: "response") as? String {
      responseLabel.text = response
    }
    if let charName = coder.decodeObject(forKey: "characterName") as? String {
      characterNameLabel.text = charName
    }
    if let playName = coder.decodeObject(forKey: "playerName") as? String {
      playerNameLabel.text = playName
    }
    if let charClass = coder.decodeObject(forKey: "characterClass") as? String {
      characterClassLabel.text = charClass
    }
    if let charRace = coder.decodeObject(forKey: "characterRace") as? String {
      characterRaceLabel.text = charRace
    }
    if let str = coder.decodeObject(forKey: "str") as? String {
      strLabel.text = str
    }
    if let dex = coder.decodeObject(forKey: "dex") as? String {
      dexLabel.text = dex
    }
    if let con = coder.decodeObject(forKey: "con") as? String {
      conLabel.text = con
    }
    if let wis = coder.decodeObject(forKey: "wis") as? String {
      wisLabel.text = wis
    }
    if let int = coder.decodeObject(forKey: "int") as? String {
      intLabel.text = int
    }
    if let cha = coder.decodeObject(forKey: "cha") as? String {
      chaLabel.text = cha
    }
    if let strM = coder.decodeObject(forKey: "strMod") as? String {
      strModLabel.text = strM
    }
    if let dexM = coder.decodeObject(forKey: "dexMod") as? String {
      dexModLabel.text = dexM
    }
    if let conM = coder.decodeObject(forKey: "conMod") as? String {
      conModLabel.text = conM
    }
    if let wisM = coder.decodeObject(forKey: "wisMod") as? String {
      wisModLabel.text = wisM
    }
    if let intM = coder.decodeObject(forKey: "intMod") as? String {
      intModLabel.text = intM
    }
    if let chaM = coder.decodeObject(forKey: "chaMod") as? String {
      chaModLabel.text = chaM
    }
    super.decodeRestorableState(with: coder)
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    self.view.endEditing(true)
  }
  
}
