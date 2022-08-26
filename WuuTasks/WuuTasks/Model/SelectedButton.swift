//
//  SelectedButton.swift
//  WuuTasks
//
//  Created by Tindwende Thierry Sawadogo on 8/22/22.
//

import Foundation

enum SelectedButton: String {
    
    case all = "All"
    case groceries = "Groceries"
    case work = "Work"
    case school = "School"
    case home = "Home"
    case personal = "Personal"
    case others = "Other(s)"
    
    func getValue() -> String {
        
        return self.rawValue
        
    }
    
}
