//
//  SoruGirViewController.swift
//  resfebe
//
//  Created by MacBook on 05/07/17.
//  Copyright © 2017 MacBook. All rights reserved.
//

import UIKit
import Firebase



class SoruGirViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var cevapText: UITextField!
    var picture = UIImage()
    
    
    @IBAction func resimSecButton(_ sender: Any) {
        
        let image = UIImagePickerController()
        image.delegate = self
        image.sourceType = UIImagePickerControllerSourceType.photoLibrary
        
        self.present(image, animated: true)
        
        
    }
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]){
    
        
        picture = (info[UIImagePickerControllerOriginalImage] as? UIImage)!
        
        if picture != nil {
            
            img.image = picture
        
            self.dismiss(animated: true, completion: {
                // ---
            })
        }
    }
    
    @IBAction func kayitButton(_ sender: Any) {
        
        let ref = Database.database().reference()

        let userID = Auth.auth().currentUser?.uid           // soruyu gonderen kişinin ıd si kayıt altına alınır
        let refer = ref.child("questions").childByAutoId()  // soru için random id üretilir. resim bu isimle kaydedilecek
        let qID = refer.key                                 // qID alınır
        refer.setValue(["cevap": self.cevapText.text])
        
        print("----")
        print(qID)
        print("----")
        

        ref.child("questions").child(qID).observeSingleEvent(of: .value, with: { (snapshot) in
            if  (snapshot.exists()){
                ref.child("questions").child(qID).child("uid").setValue(userID)
                
                // TODO: date konusunu netleştir. sorunun girilme zamanımı yayınlanma zamanımı
                ref.child("questions").child(qID).child("date").setValue("11.11.11")
                
            } else {
                print ("snapshot yok")
            }
            
            
        }) { (error) in
            print(error.localizedDescription)
        }

        //
        
        let storageRef = Storage.storage().reference()
        let tempImageRef = storageRef.child("imgDir/\(qID).png")
        
        
        let metaData = StorageMetadata()
        metaData.contentType = "image/png"

        picture = UIImage(named: "2d.png")!
        
        tempImageRef.putData(UIImageJPEGRepresentation(picture, 0.8)!, metadata: metaData) { (data, error) in
            
            if error == nil {
                
              print(" resim gonderildi")
                
            } else {
                print("resim hata!!")
            }
            
            
        }
        

        
        print (cevapText.text)
        
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
