//
//  SigninViewController.swift
//  resfebe
//
//  Created by MacBook on 13/07/17.
//  Copyright © 2017 MacBook. All rights reserved.
//

import UIKit
import Firebase
import EFInternetIndicator

class SigninViewController: UIViewController , InternetStatusIndicable {

    var internetConnectionIndicator:InternetViewIndicator?
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBAction func connect(_ sender: Any) {
        
        if ( email.text != "" && password.text != "") {
        
            Auth.auth().signIn(withEmail: email.text!, password: password.text!, completion: { (user, error) in
                
                if ( error != nil) {
                    print(error!)
                } else {
                
                    // login başarılı
                    
                    print("login basarılı")

                    let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                    let homeVC = storyBoard.instantiateViewController(withIdentifier: "HomeVC")
                    self.present(homeVC, animated: true, completion: nil)
                    
                    
                }
            })
            
        } else {
            
            print("kullanıcı adı şifre boş bırakılmaz")
        
        }
        
        
    }
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.startMonitoringInternet()
        
        //  Bu şekilde de kullanılabilir.  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        //  self.startMonitoringInternet(backgroundColor:UIColor.blue, style: .StatusLine, textColor:UIColor.white, message:"No magic on internet here :(", remoteHostName: "magic.com")
        
        
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
