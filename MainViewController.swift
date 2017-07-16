//
//  MainViewController.swift
//  resfebe
//
//  Created by MacBook on 13/07/17.
//  Copyright © 2017 MacBook. All rights reserved.
//

import UIKit
import Firebase

class MainViewController: UIViewController {

    let ref = Database.database().reference()
    var userID = ""
    
    @IBOutlet weak var nameField: UILabel!


    override func viewDidLoad() {
        
        
        // login olan kullanıcı ıdsi alınır.
        userID = (Auth.auth().currentUser?.uid)!
        
        ref.child("users").child(userID).child("name").observeSingleEvent(of: .value, with: {(snapshot) in
        
            if snapshot.exists() {
            
                let name = snapshot.value as! String
                
                if name.isEmpty {
                    print ("isim kısmı boş")
                } else {
                    self.nameField.text = name
                
                }
                
                
            } else {
                print("shapshot bulunamadı")
            }
        
         super.viewDidLoad()   
            
    })
    
        
        
        
        
    
        
        
        print(userID)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
