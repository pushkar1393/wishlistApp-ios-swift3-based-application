//
//  SearchProductsViewController.swift
//  WishListApp
//
//  Created by Pushkar Khedekar on 10/22/17.
//  Copyright © 2017 Pushkar Khedekar. All rights reserved.
//

import UIKit


class SearchProductsViewController: UIViewController {
    
    let searchProductLabel = UILabel()
    let backButton = UIButton(type: .system)
    let searchTextField = UITextField()
    let searchButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 255/255, alpha:1.0)
        setSearchProductScreen()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setSearchProductScreen(){
        
        
        view.addSubview(searchProductLabel)
        searchProductLabel.translatesAutoresizingMaskIntoConstraints = false
        searchProductLabel.text = "Search Items"
        searchProductLabel.font = searchProductLabel.font.withSize(35)
        searchProductLabel.textColor = UIColor(red: 0/255, green: 0/255, blue: 50/255, alpha:1.0)
        searchProductLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        searchProductLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
        searchProductLabel.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        
        view.addSubview(searchTextField)
        searchTextField.placeholder = "Enter Product Name"
        searchTextField.translatesAutoresizingMaskIntoConstraints = false
        searchTextField.borderStyle = .roundedRect
        searchTextField.textColor = UIColor(red: 0/255, green: 0/255, blue: 50/255, alpha:1.0)
        searchTextField.topAnchor.constraint(equalTo: searchProductLabel.bottomAnchor, constant: 15).isActive = true
        searchTextField.heightAnchor.constraint(equalToConstant: 35).isActive = true
        searchTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        searchTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive = true
        
        
        
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
        
        
        view.addSubview(searchButton)
        searchButton.setTitle("Search", for: .normal)
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        searchButton.layer.cornerRadius = 5
        searchButton.layer.masksToBounds = true
        searchButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        searchButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive = true
        searchButton.bottomAnchor.constraint(equalTo: backButton.topAnchor, constant: -20).isActive = true
        searchButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        searchButton.setTitleColor(UIColor.white, for: .normal)
        searchButton.backgroundColor = UIColor(red: 65/255, green: 105/255, blue: 225/255, alpha: 0.8)
        searchButton.addTarget(self, action: #selector(searchBtnpressed), for: .touchUpInside)
    }
    
    func backBtnpressed() {
        dismiss(animated: true, completion: nil)
    }
    
    func searchBtnpressed(){
        if searchTextField.text == nil {
            createAlert("Empty field", "Enter item name to search.")
        } else {
            viewAllItems(Cart.cart.searchItem((searchTextField.text)!)!)
            searchTextField.text = ""
        }
    }
    
    
    func createAlert(_ title : String,_ message : String){
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let OKAction = UIAlertAction(title: "OK", style: .default) { action in }
        alertController.addAction(OKAction)
        
        self.present(alertController, animated: true) {}
    }
    
    func viewAllItems(_ itemList : [Item]){
        var position : Int = 0
        if itemList.count != 0 || itemList == nil{
            for item in itemList {
                
                var textView = UITextView()
                view.addSubview(textView)
                textView.translatesAutoresizingMaskIntoConstraints = false
                textView.text = "\(item.itemName)    \(item.itemPrice) "
                textView.font = textView.font?.withSize(20)
                textView.textColor = UIColor(red: 0/255, green: 0/255, blue: 50/255, alpha:1.0)
                // textView.frame = CGRect(x: 15, y: 100 + position, width: 350, height: 35)
                textView.isUserInteractionEnabled = false
                textView.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: CGFloat(15+(position*40))).isActive = true
                textView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
                textView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive = true
                textView.heightAnchor.constraint(equalToConstant: 35).isActive = true
                
                position =  position + 1
            }
        } else {
            
            var textView = UITextView()
            view.addSubview(textView)
            textView.translatesAutoresizingMaskIntoConstraints = false
            textView.text = "No Item found "
            textView.font = textView.font?.withSize(20)
            textView.isUserInteractionEnabled = false
            textView.textColor = UIColor(red: 0/255, green: 0/255, blue: 50/255, alpha:1.0)
            textView.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: CGFloat(15)).isActive = true
            textView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
            textView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive = true
            textView.heightAnchor.constraint(equalToConstant: 35).isActive = true
        }
    }}
