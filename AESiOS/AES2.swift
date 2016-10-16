//
//  AES2.swift
//  AESiOS
//
//  Created by Muneeb Ahmad on 16/10/2016.
//  Copyright (c) 2016 Muneeb Ahmad. All rights reserved.
//
//  Swift Version -- 1.2, You can explicitly download CryptoSwift for your version of Swift.
//  XCode Version -- 6.3
//  Simulator iOS Version 8.3

//  The following source code is provided AS-IS without WARRANTY of any KIND EXPRESS or IMPLIED
//  YOu can freely distribute and modify this code.

//  With Regards Muneeb Ahmad
//  ahmadgallian@yahoo.com


import Foundation
import CryptoSwift

class AES2 {

    /**
     *  I have made this method just for demo purpose for ECB Transform mode Encryption,
     *  I am using more reliable CBC transform on Java side which is more raw and abstract and have also configured PHP script myslef for that purpose. So all platforms are now compatible with AES ECB and CBC transform modes.
     *
     * **/
    func encryptECB(key: String, iv: String, value: String) -> String {
        let data = value.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false);
        let aes = AES(key: key, iv: iv, blockMode: CipherBlockMode.ECB);
        let enc = aes?.encrypt(data!.arrayOfBytes(), padding: PKCS7());
        let encData = NSData(bytes: enc!, length: Int(enc!.count));
        let base64SString: String = encData.base64EncodedStringWithOptions(NSDataBase64EncodingOptions(rawValue: 0));
        let result = String(base64SString);
        return result;
    }
    
    /**
    *  I have made this method just for demo purpose for ECB Transform mode Decryption,
    *  I am using more reliable CBC transform on Java side which is more raw and abstract and have also configured PHP script myself for that purpose. So all platforms are now compatible with AES ECB and CBC transform modes.
    *
    * **/
    func decryptECB(key: String, iv: String, value: String) -> String {
        let data = NSData(base64EncodedString: value, options: NSDataBase64DecodingOptions(rawValue: 0));
        let aes = AES(key: key, iv: iv, blockMode: CipherBlockMode.ECB);
        let dec = aes?.decrypt(data!.arrayOfBytes(), padding: PKCS7());
        let decData = NSData(bytes: dec!, length: Int(dec!.count));
        let result = NSString(data: decData, encoding: NSUTF8StringEncoding);
        return String(result!);
    }
    
    //Used for encrypting with algo and cipher transfom mode AES/CBC and is compatible with Java.
    //Explicitly use the usage provided in ViewController.swift and just check out the difference between
    //iv of ECB and CBC, the ECB code will be commented for your convenience. ;)
    func encryptCBC(key: String, iv: String, value: String) -> String {
        let data = value.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false);
        let aes = AES(key: key, iv: iv, blockMode: CipherBlockMode.CBC);
        let enc = aes?.encrypt(data!.arrayOfBytes(), padding: PKCS7());
        let encData = NSData(bytes: enc!, length: Int(enc!.count));
        let base64SString: String = encData.base64EncodedStringWithOptions(NSDataBase64EncodingOptions(rawValue: 0));
        let result = String(base64SString);
        return result;
    }
    
    //Used for decrypting with algo and cipher transfom mode AES/CBC and is compatible with Java.
    //Explicitly use the usage provided in ViewController.swift and just check out the difference between
    //iv of ECB and CBC, the ECB code will be commented for your convenience. ;)
    func decryptCBC(key: String, iv: String, value: String) -> String {
        let data = NSData(base64EncodedString: value, options: NSDataBase64DecodingOptions(rawValue: 0));
        let aes = AES(key: key, iv: iv, blockMode: CipherBlockMode.CBC);
        let dec = aes?.decrypt(data!.arrayOfBytes(), padding: PKCS7());
        let decData = NSData(bytes: dec!, length: Int(dec!.count));
        let result = NSString(data: decData, encoding: NSUTF8StringEncoding);
        return String(result!);
    }
    
}/** end class. */