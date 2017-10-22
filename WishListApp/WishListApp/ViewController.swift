//
//  ViewController.swift
//  WishListApp
//
//  Created by Pushkar Khedekar on 10/22/17.
//  Copyright © 2017 Pushkar Khedekar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 240/255, green: 240/255, blue: 255/255, alpha:1.0)
        setHomeScreen()
        
        
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    func setHomeScreen(){
        
        //set Label for homescreen
        
        
        //set button for create a product
        
        let createButton = UIButton(type: .system)
        view.addSubview(createButton)
        createButton.setTitle("Create", for: .normal)
        createButton.translatesAutoresizingMaskIntoConstraints = false
        createButton.layer.cornerRadius = 5
        createButton.layer.masksToBounds = true
        createButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        createButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25).isActive = true
        createButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -25).isActive=true
        createButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 300).isActive = true
        createButton.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 255/255, alpha: 2.5)
        createButton.setTitleColor(UIColor.white, for: .normal)
        createButton.addTarget(self, action: #selector(createScreenBtnpressed), for: .touchUpInside)

        //List all button for  wishlist
        
        let viewButton = UIButton(type: .system)
        view.addSubview(viewButton)
        viewButton.setTitle("View", for: .normal)
        viewButton.translatesAutoresizingMaskIntoConstraints = false
        viewButton.layer.cornerRadius = 5
        viewButton.layer.masksToBounds = true
        viewButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        viewButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25).isActive = true
        viewButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -25).isActive=true
        viewButton.topAnchor.constraint(equalTo: createButton.topAnchor, constant: 100).isActive = true
        viewButton.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 255/255, alpha: 2.5)
        viewButton.setTitleColor(UIColor.white, for: .normal)
        

        
    }
    
    func createScreenBtnpressed( ){
        let createScreenVC = CreateProductViewController()
         self.present(createScreenVC, animated:true, completion:nil)
    }
    
    
    
}

