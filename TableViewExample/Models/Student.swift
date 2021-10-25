//
//  Student.swift
//  TableViewExample
//
//  Created by Jesus Jaime Cano Terrazas on 10/07/21.
//

import Foundation

class Student {
    var name = ""
    var programmingLanguage: ProgrammingLanguage = .swift
    
    init(name: String, programmingLanguage: ProgrammingLanguage) {
        self.name = name
        self.programmingLanguage = programmingLanguage
    }
}

enum ProgrammingLanguage {
    case swift
    case java
    case python
    case c
    case javaScript
    case kotlin
}
