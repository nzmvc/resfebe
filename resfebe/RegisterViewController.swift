//
//  RegisterViewController.swift
//  resfebe
//
//  Created by MacBook on 05/07/17.
//  Copyright © 2017 MacBook. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {

    
    var ref = Database.database().reference()
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var surnameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var phoneField: UITextField!
    @IBOutlet weak var password1: UITextField!
    @IBOutlet weak var password2: UITextField!
    @IBAction func registerButton(_ sender: Any) {
        
        if ( password1.text != password2.text){
            
            // password uyuşmazlığı
            
            print("password tekrarlama hatası")
            
        } else if ( !(nameField.text?.isEmpty)! && !(surnameField.text?.isEmpty)! && !(emailField.text?.isEmpty)! ){
        
            Auth.auth().createUser(withEmail: emailField.text!, password: password1.text!, completion: { (user, error) in
                
                if ( error != nil) {
                    print(error!.localizedDescription)
                    
                    // TODO: hatayı ekrana bas
                    
                } else {
                    
                    //Veri tabanına  İLK kayıt ****************************
                    
                    self.ref.child("users").child(user!.uid).setValue(["name": self.nameField.text])
                    

                    let userID = user?.uid
                    print("kullanıcının diğer bilgileri girilecek id:" + userID!)
                 
                    
                    // users da diğer bilgilerin güncellenmesi
                    self.ref.child("users").child(userID!).observeSingleEvent(of: .value, with: { (snapshot) in
                        
                        if  (snapshot.exists()){
                            self.ref.child("users").child(user!.uid).child("surname").setValue(self.surnameField.text)
                            self.ref.child("users").child(user!.uid).child("phone").setValue(self.phoneField.text)
                        
                        } else {
                            print ("snapshot yok")
                        }
                        
                        
                    }) { (error) in
                        print(error.localizedDescription)
                    }
                    
                    
                    
                    print("kullanıcı kaydınız gerçekleşti id :" + (user?.uid)!)
                    //self.emailField.text=""
                    //self.password1.text=""
                    //self.password2.text=""
                    
                    // TODO: login sayfasına geri dön. email kısmına kullanıcının email ini yaz. şifre boş olsun.
                }
            })
            
        } else {
            
            print("ad, soyad, email bos bırakılamaz")
            
            // TODO: zorunlu alanları doldurunuz.
        
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

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
