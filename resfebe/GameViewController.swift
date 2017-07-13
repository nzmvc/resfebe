//
//  GameViewController.swift
//  resfebe
//
//  Created by MacBook on 29/05/17.
//  Copyright © 2017 MacBook. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    var secim = [Int]()
    var cevapTmp = String()
    var btnTemp = UIButton()
    
    @IBOutlet weak var cevap: UILabel!
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        
        //button.titleLabel?.text = "X"
        
        // TODO: resim cekilerek ekrana basılacak
        // TODO: cevap alınacak
        // TODO: cevap ve kalan sayıda random harf, cevap butonlarına dağıtılacak
        
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        
        cevap.text?.append((sender.titleLabel?.text)!)
        secim.append(sender.tag)
        sender.isEnabled = false
        
        //TODO: cevap kontrol edilecek doğru ise puan artacak yeni soru gelecek !!!!!!! 
        
    }
    @IBAction func silButton(_ sender: Any) {
        
        // tıklanan son harf aktif edilir
        
        if secim.count > 0 {
            btnTemp = self.view.viewWithTag(secim[secim.count-1]) as! UIButton;
            btnTemp.isEnabled = true;
            secim.removeLast()   // seçilmiş son eleman secim listesinden silinir
            
            // cevaptan son  karakter silinir.
        
            if cevap.text != nil {
                cevapTmp = cevap.text!
                cevap.text = cevapTmp.substring(to: cevapTmp.index(before: cevapTmp.endIndex) )
            
            }
        }
        
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
