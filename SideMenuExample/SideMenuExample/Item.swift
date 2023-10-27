//
//  Item.swift
//  SideMenuExample
//
//  Created by John Baker on 10/26/23.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
