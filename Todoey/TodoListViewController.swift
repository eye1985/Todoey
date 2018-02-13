//
//  ViewController.swift
//  Todoey
//
//  Created by Erik Ye on 06/02/2018.
//  Copyright © 2018 Erik Ye. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    @IBOutlet weak var addItemButton: UIBarButtonItem!
    
    var itemArray = [Item]()
    
    let defaults = UserDefaults.standard
    
    var alertAction = UIAlertAction()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        if let items = defaults.array(forKey: "TodoListArray") as? [Item] {
//            itemArray = items
//        }
        
        let newItem = Item()
        newItem.title = "Find Mile"
        
        itemArray.append(newItem)
        
        let newItem2 = Item()
        newItem2.title = "Find Mile"
        itemArray.append(newItem2)
        
        let newItem3 = Item()
        newItem3.title = "Find Mile"
        itemArray.append(newItem3)
        
    }
    
    
    // MARK - Tableview funcs
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(itemArray.count)
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath)
        
        let item = itemArray[indexPath.row]
        
        cell.textLabel?.text = item.title
        
        cell.accessoryType = item.done ? .checkmark : .none
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
        tableView.reloadData()
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    // MARK - Actions
    
    @IBAction func addItemButtonClicked(_ sender: UIBarButtonItem) {
        
        let alert = UIAlertController(title: "Add new Todoey Item", message: "", preferredStyle: .alert)
        var textField = UITextField()
        
        let action = UIAlertAction(title: "Add item", style: .default) { (action) in
            
            if let text = textField.text {
                if text.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
                    textField.layer.borderColor = UIColor.red.cgColor
                    
                }else{
                    self.itemArray.append(Item(text, false))
//                    self.defaults.set(self.itemArray, forKey: "TodoListArray")
                    self.tableView.reloadData()
                }
            }
        }
        
        alertAction = action;
        alertAction.isEnabled = false
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
            textField.addTarget(self, action: #selector(self.textDidChange), for: .editingChanged)
        }
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    
    
    @objc func textDidChange(_ sender:UITextField, action:UIAlertAction ) {
        alertAction.isEnabled = sender.text!.count > 0
    }

}
