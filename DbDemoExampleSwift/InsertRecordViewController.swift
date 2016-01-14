//
//  InsertRecordViewController.swift
//  DbDemoExampleSwift
//
//  Created by Philippe petit on 11/01/2016.
//  Copyright © 2016 Philippe petit. All rights reserved.
//

import UIKit

class InsertRecordViewController: UIViewController {
    
    // MARK: Properties
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtMarks: UITextField!
    
    // MARK: Actions
    
    @IBAction func btnSaveClicked(sender: AnyObject) {
        let studentInfo = StudentInfo()
        studentInfo.name = txtName.text!
        studentInfo.marks = txtMarks.text!
        
        let studenData = ModelManager.sharedInstance
        let isInserted = studenData.addStudentData(studentInfo)
        if isInserted {
            Util.showAlertOnViewContrlr(self, title: "Success", message: "Record Inserted successfully")
            
        }else {
            Util.showAlertOnViewContrlr(self, title: "Failed", message: "Error in inserting record")
        }
        
    }
}
