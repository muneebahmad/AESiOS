//
//  ViewController.swift
//  AESiOS
//
//  Created by Muneeb Ahmad on 16/10/2016.
//  Copyright (c) 2016 Muneeb Ahmad. All rights reserved.

//  Swift Version -- 1.2, You can explicitly download CryptoSwift for your version of Swift.
//  XCode Version -- 6.3
//  Simulator iOS Version 8.3

//  The following source code is provided AS-IS without WARRANTY of any KIND EXPRESS or IMPLIED
//  YOu can freely distribute and modify this code.

//  With Regards Muneeb Ahmad
//  ahmadgallian@yahoo.com


import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tvEncrypt: UITextView!
    @IBOutlet weak var tvkey: UITextField!
    
    //Code for ECB is commented, use that to test AES/ECB
    @IBAction func encryptClicked(sender: UIButton) {
        let aes = AES2();
        let ivECB: String = "";
        let ivCBC: String = "RandomInitVector";         //16 bytes
        let key: String = tvkey.text;
        let value: String = tvEncrypt.text;
        let encrypted: String = aes.encryptCBC(key, iv: ivCBC, value: value);       //For CBC
//        let encrypted: String = aes.encryptECB(key, iv: ivECB, value: value);
        tvEncrypt.text = encrypted;
        println("Encrypted AES/CBC: " + encrypted);
        makeResultDialog("ENCRYPTED AES/CBC", message: encrypted);
    }
    
    //Code for ECB is commented, use that to test AES/ECB
    @IBAction func decryptClicked(sender: UIButton) {
        let aes = AES2();
        let ivECB: String = "";
        let ivCBC: String = "RandomInitVector";     //16 bytes
        let key: String = tvkey.text;
        let value: String = tvEncrypt.text;
        //let decrypted: String = aes.decryptECB(key, iv: ivECB, value: value);
        let decrypted: String = aes.decryptCBC(key, iv: ivCBC, value: value);
        tvEncrypt.text = decrypted;
        println("Decrypted AES/CBC: " + decrypted);
        makeResultDialog("DECRYPTED AES/ECB", message: decrypted);
    }
    
    func makeResultDialog(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert);
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil));
        self.presentViewController(alert, animated: true, completion: nil);
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}/** end class. */

