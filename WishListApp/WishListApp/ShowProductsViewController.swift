//
//  ShowProductsViewController.swift
//  WishListApp
//
//  Created by Pushkar Khedekar on 10/22/17.
//  Copyright © 2017 Pushkar Khedekar. All rights reserved.
//

import UIKit

class ShowProductsViewController: UIViewController {
    let createProductLabel = UILabel()
    let backButton = UIButton(type: .system)
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 255/255, alpha:1.0)
        setShowProductsScreen()
        
        
    }
    
    func setShowProductsScreen() {
        
        //title for this screen
        
        
        view.addSubview(createProductLabel)
        createProductLabel.translatesAutoresizingMaskIntoConstraints = false
        createProductLabel.text = "My Wishlist"
        createProductLabel.font = createProductLabel.font.withSize(35)
        createProductLabel.textColor = UIColor(red: 0/255, green: 0/255, blue: 50/255, alpha:1.0)
        createProductLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        createProductLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
        createProductLabel.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
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
        
        
        viewAllItems()
        
        
    }
    func viewAllItems(){
        var position : Int = 0
        for item in Cart.cart.listAllItems() {
            
            var textView = UITextView()
            view.addSubview(textView)
            textView.translatesAutoresizingMaskIntoConstraints = false
            textView.text = "\(item.itemName)    \(item.itemPrice) "
            textView.font = textView.font?.withSize(20)
            textView.textColor = UIColor(red: 0/255, green: 0/255, blue: 50/255, alpha:1.0)
            // textView.frame = CGRect(x: 15, y: 100 + position, width: 350, height: 35)
            
            textView.topAnchor.constraint(equalTo: createProductLabel.bottomAnchor, constant: CGFloat(15+(position*40))).isActive = true
            textView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
            textView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive = true
            textView.heightAnchor.constraint(equalToConstant: 35).isActive = true
            
            position =  position + 1
        }
        
        
    }
    
    func backBtnpressed() {
        dismiss(animated: true, completion: nil)
    }
    
    
}
