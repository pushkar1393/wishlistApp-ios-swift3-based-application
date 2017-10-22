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
        
        let xCoordinate : Int = 15
        let yCoordinate : Int = 50
        let width : Int = 500
        let height : Int = 100
        
        createButton("Create")
      //  createButton("Show All", xCoordinate, yCoordinate+200, width, height)
       // createButton("Delete", xCoordinate, yCoordinate+600, width, height)
        
        
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func createButton(_ buttonName : String){
        let button = UIButton()
        button.setTitle(buttonName, for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor.darkGray
        button.frame = CGRect(x : view.frame.width/2 - 200, y : view.frame.height/2 - 300, width : 400, height : 50)
        view.addSubview(button)
    }
    
    
}

