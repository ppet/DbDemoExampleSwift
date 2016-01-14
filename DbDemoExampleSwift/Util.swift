//
//  Util.swift
//  DbDemoExampleSwift
//
//  Created by Philippe petit on 13/01/2016.
//  Copyright © 2016 Philippe petit. All rights reserved.
//

import Foundation
import UIKit

class Util: NSObject {
    
    class func getPath(fileName: String) -> String {
        let documentsURL = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)[0]
        let fileURL = documentsURL.URLByAppendingPathComponent(fileName)
        
        return fileURL.path!
    }
    
    class func copyFile(targetVC: UIViewController, fileName: NSString) {
        let dbPath = getPath(fileName as String)
        let fileManager = NSFileManager.defaultManager()
        
        if !fileManager.fileExistsAtPath(dbPath) {
            let documentsURL = NSBundle.mainBundle().resourceURL
            let fromPath = documentsURL!.URLByAppendingPathComponent(fileName as String)
            
            var error: NSError?
            
            do {
                try fileManager.copyItemAtPath(fromPath.path!, toPath: dbPath)
            } catch let error1 as NSError {
                error = error1
            }
            
            if (error != nil) {
                Util.showAlertOnViewContrlr(targetVC, title: "Error Occured", message: (error?.localizedDescription)!)
            } else {
                Util.showAlertOnViewContrlr(targetVC, title: "Successfully copied", message: "Your database copy was successfull !")
            }
        }
    }
    
    class func showAlertOnViewContrlr(targetVC: UIViewController, title: String, message: String) {
        let theTitle = NSLocalizedString(title, comment: "")
        let theMessage = NSLocalizedString(message, comment: "")
        
        let alert = UIAlertController(title: theTitle, message: theMessage, preferredStyle: .Alert)
        let cancelButton = UIAlertAction(title: "Cancel", style: .Cancel, handler: { (action) in })
        alert.addAction(cancelButton)
        
        let okButton = UIAlertAction(title: "OK", style: .Default, handler: { (alert: UIAlertAction!) in })
        alert.addAction(okButton)
        
        // Affichage sur le view controller cible
        targetVC.presentViewController(alert, animated: true, completion: nil)
        
    }
}