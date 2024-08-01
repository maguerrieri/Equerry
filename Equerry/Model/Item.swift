//
//  Item.swift
//  Equerry
//
//  Created by Mario Guerrieri on 6/6/23.
//

import Foundation
import SwiftData

@Model
class Item {
    var timestamp: Date

    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
