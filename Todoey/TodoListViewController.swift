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
    
    var itemArray = [String]()
    var alertAction = UIAlertAction()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    // MARK - Tableview funcs
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedItem = itemArray[indexPath.row]
        
        if let cell = tableView.cellForRow(at: indexPath) {
            if cell.accessoryType == .none {
                cell.accessoryType = .checkmark
            }else{
                cell.accessoryType = .none
            }
        }
        
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
                    print("1")
                }else{
                    print("2")
                    self.itemArray.append(text)
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
