//
//  DeleteItemViewController.swift
//  Wishlist2
//
//  Created by Pushkar Khedekar on 10/30/17.
//  Copyright © 2017 Pushkar Khedekar. All rights reserved.
//

import UIKit

class DeleteItemViewController: UIViewController {
    
    @IBOutlet weak var deleteItemTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)

        // Do any additional setup after loading the view.
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "closeDelete", sender: self)
    }
    
    @IBAction func deleteButtonPressed(_ sender: Any) {
        
        if deleteItemTextField.text == ""{
            createAlert("Empty Field", "Enter Item name to delete")
        } else if Cart.cart.removeItem(deleteItemTextField.text!)! == false{
            createAlert("Information", "No Item found to delete")
            deleteItemTextField.text = ""
        } else {
            createAlert("Success", "Item deleted successfully!")
            deleteItemTextField.text = ""
        }
    }
    
    func createAlert(_ title : String,_ message : String){
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let OKAction = UIAlertAction(title: "OK", style: .default) { action in }
        alertController.addAction(OKAction)
        
        self.present(alertController, animated: true) {}
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
