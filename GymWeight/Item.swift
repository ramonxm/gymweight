//
//  Item.swift
//  GymWeight
//
//  Created by Ramon Xavier on 08/07/24.
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
