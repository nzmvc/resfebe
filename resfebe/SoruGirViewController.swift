//
//  SoruGirViewController.swift
//  resfebe
//
//  Created by MacBook on 05/07/17.
//  Copyright © 2017 MacBook. All rights reserved.
//

import UIKit



class SoruGirViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var img: UIImageView!

    @IBOutlet weak var cevapText: UITextField!
    @IBAction func resimSecButton(_ sender: Any) {
        
        let image = UIImagePickerController()
        image.delegate = self
        image.sourceType = UIImagePickerControllerSourceType.photoLibrary
        
        self.present(image, animated: true)
        
        
    }
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]){
    
        if let picture = info[UIImagePickerControllerOriginalImage] as? UIImage {
            
            img.image = picture
        
            self.dismiss(animated: true, completion: {
                // ---
            })
        }
    }
    
    @IBAction func kayitButton(_ sender: Any) {
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
