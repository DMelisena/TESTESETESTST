//
//  FishFamily.swift
//  FindingNemo
//
//  Created by IP Marry Kusuma on 13/08/25.
//

import Foundation
import SwiftData

@Model
final class FishFamily {
    @Attribute(.unique) var uid: UUID
    var name: String
    var thumbnailURL: String
    var fishes: [Fish]
    
    init(uid: UUID, name: String, thumbnailURL: String, fishes: [Fish]) {
        self.uid = uid
        self.name = name
        self.thumbnailURL = thumbnailURL
        self.fishes = fishes
    }
}
