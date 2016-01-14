//
//  ModelManager.swift
//  DbDemoExampleSwift
//
//  Created by Philippe petit on 13/01/2016.
//  Copyright © 2016 Philippe petit. All rights reserved.
//
// Singleton Pattern

import Foundation

class ModelManager {
    
    // MARK: Properties
    static let sharedInstance = ModelManager()
    private var database: FMDatabase? = nil
    
    // MARK: Private Constructor
    private init() {
        print("Init ModelManager")
        database = FMDatabase(path: Util.getPath("Student.sqlite"))
    }
    
    
    // MARK: Actions
    func addStudentData(studentInfo: StudentInfo) -> Bool {
        database!.open()
        let isInserted = database!.executeUpdate("INSERT INTO student_info (Name, Marks) VALUES (?, ?)", withArgumentsInArray: [studentInfo.name, studentInfo.marks])
        database!.close()
        
        return isInserted
    }
}