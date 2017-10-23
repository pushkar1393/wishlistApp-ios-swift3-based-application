//
//  DeleteProductViewController.swift
//  WishListApp
//
//  Created by Pushkar Khedekar on 10/22/17.
//  Copyright © 2017 Pushkar Khedekar. All rights reserved.
//

import UIKit


class DeleteProductViewController : UIViewController {
    
    let backButton = UIButton(type: .system)
    let deleteProductLabel = UILabel()
    let deleteItemTextField = UITextField()
    let deleteButton = UIButton(type: .system)
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 255/255, alpha:1.0)
        setDeleteProductScreen()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setDeleteProductScreen() {
        
        view.addSubview(deleteProductLabel)
        deleteProductLabel.translatesAutoresizingMaskIntoConstraints = false
        deleteProductLabel.text = "Delete an Item"
        deleteProductLabel.font = deleteProductLabel.font.withSize(35)
        deleteProductLabel.textColor = UIColor(red: 0/255, green: 0/255, blue: 50/255, alpha:1.0)
        deleteProductLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        deleteProductLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
        deleteProductLabel.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        
        view.addSubview(deleteItemTextField)
        deleteItemTextField.placeholder = "Enter Item Name"
        deleteItemTextField.translatesAutoresizingMaskIntoConstraints = false
        deleteItemTextField.borderStyle = .roundedRect
        deleteItemTextField.topAnchor.constraint(equalTo: deleteProductLabel.topAnchor, constant: 60).isActive = true
        deleteItemTextField.heightAnchor.constraint(equalToConstant:35).isActive = true
        deleteItemTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        deleteItemTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive = true

        
        
        view.addSubview(backButton)
        backButton.setTitle("Back", for: .normal)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.layer.cornerRadius = 5
        backButton.layer.masksToBounds = true
        backButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        backButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        backButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
        backButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive = true
        backButton.backgroundColor = UIColor(red: 65/255, green: 105/255, blue: 225/255, alpha: 0.8)
        backButton.setTitleColor(UIColor.white, for: .normal)
        backButton.addTarget(self, action: #selector(backBtnpressed), for: .touchUpInside)
        
        
        
        view.addSubview(deleteButton)
        deleteButton.setTitle("Delete", for: .normal)
        deleteButton.translatesAutoresizingMaskIntoConstraints = false
        deleteButton.layer.cornerRadius = 5
        deleteButton.layer.masksToBounds = true
        deleteButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        deleteButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        deleteButton.bottomAnchor.constraint(equalTo: backButton.topAnchor, constant: -20).isActive = true
        deleteButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive = true
        deleteButton.backgroundColor = UIColor(red: 65/255, green: 105/255, blue: 225/255, alpha: 0.8)
        deleteButton.setTitleColor(UIColor.white, for: .normal)
        deleteButton.addTarget(self, action: #selector(deleteItemBtnpressed), for: .touchUpInside)
        
        
        
    }
    
    
    
    func backBtnpressed() {
        dismiss(animated: true, completion: nil)
    }
    
    func deleteItemBtnpressed(){
        if deleteItemTextField.text == ""{
            createAlert("Empty Field", "Enter Item name to delete")
        } else if Cart.cart.removeItem(deleteItemTextField.text!)! == false{
            createAlert("Information", "No Item found to delete")
        } else {
            createAlert("Success", "Item deleted successfully!")
        }
        
    }
    
    func createAlert(_ title : String,_ message : String){
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let OKAction = UIAlertAction(title: "OK", style: .default) { action in }
        alertController.addAction(OKAction)
        
        self.present(alertController, animated: true) {}
    }
}
