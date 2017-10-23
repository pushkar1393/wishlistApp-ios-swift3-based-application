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
        
        //create title to display banner
        let bannerLabel = UILabel()
        view.addSubview(bannerLabel)
        bannerLabel.translatesAutoresizingMaskIntoConstraints = false
        bannerLabel.layer.masksToBounds = true
        bannerLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
        bannerLabel.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        bannerLabel.textAlignment = NSTextAlignment.center
        bannerLabel.rightAnchor.constraint(equalTo: view.rightAnchor).isActive=true
        bannerLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        bannerLabel.backgroundColor = UIColor(red: 65/255, green: 105/255, blue: 225/255, alpha: 2.5)
        bannerLabel.text = "wishlist"
        bannerLabel.font = bannerLabel.font.withSize(100)
        bannerLabel.font = UIFont.boldSystemFont(ofSize: 60)
        bannerLabel.textColor = UIColor.white
        
        //set button for create a product
        
        let createButton = UIButton(type: .system)
        view.addSubview(createButton)
        createButton.setTitle("Create", for: .normal)
        createButton.translatesAutoresizingMaskIntoConstraints = false
        createButton.layer.cornerRadius = 5
        createButton.layer.masksToBounds = true
        createButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        createButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        createButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive=true
        createButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
        createButton.backgroundColor = UIColor(red: 65/255, green: 105/255, blue: 225/255, alpha: 2.5)
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
        viewButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        viewButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive=true
        viewButton.topAnchor.constraint(equalTo: createButton.topAnchor, constant: 75).isActive = true
        viewButton.backgroundColor = UIColor(red: 65/255, green: 105/255, blue: 225/255, alpha: 2.5)
        viewButton.setTitleColor(UIColor.white, for: .normal)
        viewButton.addTarget(self, action: #selector(viewAllScreenBtnpressed), for: .touchUpInside)
        
        
        let searchButton = UIButton(type: .system)
        view.addSubview(searchButton)
        searchButton.setTitle("Search", for: .normal)
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        searchButton.layer.cornerRadius = 5
        searchButton.layer.masksToBounds = true
        searchButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        searchButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        searchButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive=true
        searchButton.topAnchor.constraint(equalTo: viewButton.topAnchor, constant: 75).isActive = true
        searchButton.backgroundColor = UIColor(red: 65/255, green: 105/255, blue: 225/255, alpha: 2.5)
        searchButton.setTitleColor(UIColor.white, for: .normal)
        searchButton.addTarget(self, action: #selector(searchBtnpressed), for: .touchUpInside)
        
        
        let deleteButton = UIButton(type: .system)
        view.addSubview(deleteButton)
        deleteButton.setTitle("Delete", for: .normal)
        deleteButton.translatesAutoresizingMaskIntoConstraints = false
        deleteButton.layer.cornerRadius = 5
        deleteButton.layer.masksToBounds = true
        deleteButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        deleteButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        deleteButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive=true
        deleteButton.topAnchor.constraint(equalTo: searchButton.topAnchor, constant: 75).isActive = true
        deleteButton.backgroundColor = UIColor(red: 65/255, green: 105/255, blue: 225/255, alpha: 2.5)
        deleteButton.setTitleColor(UIColor.white, for: .normal)
        deleteButton.addTarget(self, action: #selector(deleteBtnpressed), for: .touchUpInside)
        
        
        
    }
    
    func createScreenBtnpressed( ){
        let createScreenVC = CreateProductViewController()
        self.present(createScreenVC, animated:true, completion:nil)
    }
    
    
    func viewAllScreenBtnpressed(){
        let ViewAllScreenVC = ShowProductsViewController()
        self.present(ViewAllScreenVC, animated:true, completion:nil)
    }
    
    
    func searchBtnpressed(){
        let searchScreenVC = SearchProductsViewController()
        self.present(searchScreenVC, animated: true, completion: nil)
    }
    
    func deleteBtnpressed(){
        let deleteScreenVC = DeleteProductViewController()
        self.present(deleteScreenVC, animated: true, completion: nil)
        
    }
}

