//
//  InitiativeViewController.swift
//  CharacterCreator
//
//  Created by Keenan Rood on 3/15/17.
//  Copyright © 2017 Keenan Rood. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class InitiativeViewController: UIViewController {
  
  
  @IBOutlet weak var tableView: UITableView!
  
  var players: [NSManagedObject] = []
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    title = "Initiative Tracker"
    UINavigationBar.appearance().titleTextAttributes = [NSFontAttributeName: UIFont(name: "Papyrus", size: 20)!]
    
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    
    self.tableView.isEditing = true
    
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    
    guard let appDelegate =
      UIApplication.shared.delegate as? AppDelegate else {
        return
    }
    
    let managedContext =
      appDelegate.persistentContainer.viewContext
    
  
    let fetchRequest =
      NSFetchRequest<NSManagedObject>(entityName: "Player")
    
    do {
      players = try managedContext.fetch(fetchRequest)
    } catch let error as NSError {
      print("Could not fetch. \(error), \(error.userInfo)")
    }
  }
  
  @IBAction func addInitiative(_ sender: Any) {
    let alert = UIAlertController(title: "New Initiative",
                                  message: "Add a new initiative",
                                  preferredStyle: .alert)
    
    let saveAction = UIAlertAction(title: "Save", style: .default) {
      [unowned self] action in
      
      guard let textField = alert.textFields?.first,
        let nameToSave = textField.text else {
          return
      }
      
      self.save(name: nameToSave)
      self.tableView.reloadData()
    }
    
    let cancelAction = UIAlertAction(title: "Cancel",
                                     style: .default)
    
    alert.addTextField()
    
    alert.addAction(saveAction)
    alert.addAction(cancelAction)
    
    present(alert, animated: true)
  }
  
  func save(name: String) {
    
    guard let appDelegate =
      UIApplication.shared.delegate as? AppDelegate else {
        return
    }
    
    let managedContext =
      appDelegate.persistentContainer.viewContext

    let entity =
      NSEntityDescription.entity(forEntityName: "Player",
                                 in: managedContext)!
    
    let player = NSManagedObject(entity: entity,
                                 insertInto: managedContext)

    player.setValue(name, forKeyPath: "name")
    

    do {
      try managedContext.save()
      players.append(player)
    } catch let error as NSError {
      print("Could not save. \(error), \(error.userInfo)")
    }
  }
  
}



// MARK: - UITableViewDataSource
extension InitiativeViewController: UITableViewDataSource {
  
  func numberOfSectionsInTableView(tableView: UITableView)
    -> Int {
      return 1
  }
  
  func tableView(_ tableView: UITableView,
                 numberOfRowsInSection section: Int) -> Int {
    return players.count
  }
  
  func tableView(_ tableView: UITableView,
                 cellForRowAt indexPath: IndexPath)
    -> UITableViewCell {
      
      let player = players[indexPath.row]
      let cell =
        tableView.dequeueReusableCell(withIdentifier: "Cell",
                                      for: indexPath)
      cell.textLabel?.text =
        player.value(forKeyPath: "name") as? String
      cell.textLabel?.font = UIFont(name: "Papyrus", size: 17)
      return cell
  }
  
  func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
    return .none
  }
  
  func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
    return false
  }

  func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
    let movedObject = self.players[sourceIndexPath.row]
    players.remove(at: sourceIndexPath.row)
    players.insert(movedObject, at: destinationIndexPath.row)
    
  }


  func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
    
    let noteEntity = "Player"
    
    let managedContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    let note = players[indexPath.row]
    
    if editingStyle == .delete {
      managedContext.delete(note)
      
      do {
        try managedContext.save()
      } catch let error as NSError {
        print("Error While Deleting Note: \(error.userInfo)")
      }
      
    }
    
    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: noteEntity)
    
    do {
      players = try managedContext.fetch(fetchRequest) as! [Player]
    } catch let error as NSError {
      print("Error While Fetching Data From DB: \(error.userInfo)")
    }
    tableView.reloadData()
  }

  
  
}
