//
//  CreateProductViewController.swift
//  WishListApp
//
//  Created by Pushkar Khedekar on 10/22/17.
//  Copyright © 2017 Pushkar Khedekar. All rights reserved.
//

import UIKit


class CreateProductViewController: UIViewController {
    
    let createButton = UIButton(type: .system)
    let resetButton = UIButton(type: .system)
    let backButton = UIButton(type: .system)
    let itemNameTextField = UITextField()
    let itemDescriptionTextField = UITextField()
    let itemPriceTextField = UITextField()
    let storeNameTextField = UITextField()
    let storeAddressTextField = UITextField()
    let storeContactTextField = UITextField()
    let categoryTextField = UITextField()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 255/255, alpha:1.0)
        setCreateProductScreen()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func setCreateProductScreen(){
        
        //title for this screen
        let createProductLabel = UILabel()
        view.addSubview(createProductLabel)
        createProductLabel.translatesAutoresizingMaskIntoConstraints = false
        createProductLabel.text = "Create an Item"
        createProductLabel.font = createProductLabel.font.withSize(35)
        createProductLabel.textColor = UIColor(red: 0/255, green: 0/255, blue: 50/255, alpha:1.0)
        createProductLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        createProductLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
        createProductLabel.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        //fields to add data
        
        view.addSubview(itemNameTextField)
        itemNameTextField.placeholder = "Enter Product Name"
        itemNameTextField.translatesAutoresizingMaskIntoConstraints = false
        itemNameTextField.borderStyle = .roundedRect
        itemNameTextField.topAnchor.constraint(equalTo: createProductLabel.topAnchor, constant: 60).isActive = true
        itemNameTextField.heightAnchor.constraint(equalToConstant:35).isActive = true
        itemNameTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25).isActive = true
        itemNameTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -25).isActive = true
        
        
        view.addSubview(itemDescriptionTextField)
        itemDescriptionTextField.placeholder = "Enter Product Description"
        itemDescriptionTextField.translatesAutoresizingMaskIntoConstraints = false
        itemDescriptionTextField.borderStyle = .roundedRect
        itemDescriptionTextField.topAnchor.constraint(equalTo: itemNameTextField.topAnchor, constant: 45).isActive = true
        itemDescriptionTextField.heightAnchor.constraint(equalToConstant:35).isActive = true
        itemDescriptionTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25).isActive = true
        itemDescriptionTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -25).isActive = true
        
        
        view.addSubview(itemPriceTextField)
        itemPriceTextField.placeholder = "Enter Product Price"
        itemPriceTextField.translatesAutoresizingMaskIntoConstraints = false
        itemPriceTextField.borderStyle = .roundedRect
        itemPriceTextField.topAnchor.constraint(equalTo: itemDescriptionTextField.topAnchor, constant: 45).isActive = true
        itemPriceTextField.heightAnchor.constraint(equalToConstant:35).isActive = true
        itemPriceTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25).isActive = true
        itemPriceTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -25).isActive = true
        
        
        view.addSubview(storeNameTextField)
        storeNameTextField.placeholder = "Enter Product Store"
        storeNameTextField.translatesAutoresizingMaskIntoConstraints = false
        storeNameTextField.borderStyle = .roundedRect
        storeNameTextField.topAnchor.constraint(equalTo: itemPriceTextField.topAnchor, constant: 45).isActive = true
        storeNameTextField.heightAnchor.constraint(equalToConstant:35).isActive = true
        storeNameTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25).isActive = true
        storeNameTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -25).isActive = true
        
        view.addSubview(storeAddressTextField)
        storeAddressTextField.placeholder = "Enter Store Address"
        storeAddressTextField.translatesAutoresizingMaskIntoConstraints = false
        storeAddressTextField.borderStyle = .roundedRect
        storeAddressTextField.topAnchor.constraint(equalTo: storeNameTextField.topAnchor, constant: 45).isActive = true
        storeAddressTextField.heightAnchor.constraint(equalToConstant:35).isActive = true
        storeAddressTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25).isActive = true
        storeAddressTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -25).isActive = true
        
        view.addSubview(storeContactTextField)
        storeContactTextField.placeholder = "Enter Store Address"
        storeContactTextField.translatesAutoresizingMaskIntoConstraints = false
        storeContactTextField.borderStyle = .roundedRect
        storeContactTextField.topAnchor.constraint(equalTo: storeAddressTextField .topAnchor, constant: 45).isActive = true
        storeContactTextField.heightAnchor.constraint(equalToConstant:35).isActive = true
        storeContactTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25).isActive = true
        storeContactTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -25).isActive = true
        
        
        view.addSubview(categoryTextField)
        categoryTextField.placeholder = "Enter Product Category"
        categoryTextField.translatesAutoresizingMaskIntoConstraints = false
        categoryTextField.borderStyle = .roundedRect
        categoryTextField.topAnchor.constraint(equalTo: storeContactTextField.topAnchor, constant: 45).isActive = true
        categoryTextField.heightAnchor.constraint(equalToConstant:35).isActive = true
        categoryTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25).isActive = true
        categoryTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -25).isActive = true
        
        //create button to add item
        
        
        view.addSubview(createButton)
        createButton.setTitle("Create", for: .normal)
        createButton.translatesAutoresizingMaskIntoConstraints = false
        createButton.layer.cornerRadius = 5
        createButton.layer.masksToBounds = true
        createButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        createButton.leftAnchor.constraint(equalTo: view.centerXAnchor, constant: 5).isActive = true
        createButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -25).isActive = true
        createButton.topAnchor.constraint(equalTo: categoryTextField.bottomAnchor, constant: 50).isActive = true
        createButton.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 255/255, alpha: 0.4)
        createButton.setTitleColor(UIColor.white, for: .normal)
        createButton.addTarget(self, action: #selector(createItemBtnpressed), for: .touchUpInside)
        
        //back button to go to home screen
        
        
        view.addSubview(backButton)
        backButton.setTitle("Back", for: .normal)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.layer.cornerRadius = 5
        backButton.layer.masksToBounds = true
        backButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        backButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25).isActive = true
        backButton.topAnchor.constraint(equalTo: categoryTextField.bottomAnchor, constant: 50).isActive = true
        backButton.rightAnchor.constraint(equalTo: view.centerXAnchor, constant: -5).isActive = true
        backButton.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 255/255, alpha: 0.4)
        backButton.setTitleColor(UIColor.white, for: .normal)
        backButton.addTarget(self, action: #selector(backBtnpressed), for: .touchUpInside)
        
        //reset button to reset fields
        
        
        view.addSubview(resetButton)
        resetButton.setTitle("Reset", for: .normal)
        resetButton.translatesAutoresizingMaskIntoConstraints = false
        resetButton.layer.cornerRadius = 5
        resetButton.layer.masksToBounds = true
        resetButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        resetButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25).isActive = true
        resetButton.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 20).isActive = true
        resetButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -25).isActive = true
        resetButton.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 255/255, alpha: 0.4)
        resetButton.setTitleColor(UIColor.white, for: .normal)
        resetButton.addTarget(self, action: #selector(resetBtnpressed), for: .touchUpInside)
        
    }
    
    func createItemBtnpressed() {
        if checkIsValid() == 1 {
            var store = Store(storeNameTextField.text!,storeAddressTextField.text!, Int64(storeContactTextField.text!)!)
            
            var item = Item(itemNameTextField.text!, itemDescriptionTextField.text!, Int(itemPriceTextField.text!)!, store, categoryTextField.text!)
            
            Cart.cart.addItem(item)
            createAlert("Congratulations","Item added successfully !")
            resetBtnpressed()
            
        } else  if checkIsValid() == 2{
            
            createAlert("Empty fields","Please enter all details")
            
        } else if checkIsValid() == 3{
            
            
            createAlert("Invalid Price","Please enter a valid price ")
            itemPriceTextField.text = ""
        } else if checkIsValid() == 4{
            
            createAlert("Invalid Contact Info","Please enter a valid contact info")
            storeContactTextField.text = ""
        }
    }
    
    func checkIsValid() -> Int {
        if itemNameTextField.text == "" && itemPriceTextField.text == "" && itemDescriptionTextField.text == "" && categoryTextField.text == "" && storeNameTextField.text == "" && storeAddressTextField.text == "" && storeContactTextField.text == "" {
            return 2
        } else if Int(itemPriceTextField.text!) == nil{
            return 3
        } else if Int64(storeContactTextField.text!) == nil{
            return 4
        }
        return 1;
    }
    
    
    func createAlert(_ title : String,_ message : String){
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let OKAction = UIAlertAction(title: "OK", style: .default) { action in }
        alertController.addAction(OKAction)
        
        self.present(alertController, animated: true) {}
    }
    
    func resetBtnpressed(){
        itemNameTextField.text=""
        itemDescriptionTextField.text=""
        itemPriceTextField.text=""
        storeContactTextField.text=""
        storeAddressTextField.text=""
        storeNameTextField.text=""
        categoryTextField.text=""
    }
    
    func backBtnpressed() {
        dismiss(animated: true, completion: nil)
    }
    
}
