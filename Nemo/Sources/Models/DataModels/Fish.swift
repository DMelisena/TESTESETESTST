//
//  Fish.swift
//  FindingNemo
//
//  Created by IP Marry Kusuma on 13/08/25.
//

import Foundation
import SwiftData

@Model
final class Fish {
    @Attribute(.unique) var uid: UUID
    var familyName: String
    var speciesName: String
    var imageURL: String
    var isIdentified: Bool
    var dateTaken: Date
    
    init(uid: UUID, familyName: String, speciesName: String, imageURL: String, isIdentified: Bool, dateTaken: Date) {
        self.uid = uid
        self.familyName = familyName
        self.speciesName = speciesName
        self.imageURL = imageURL
        self.isIdentified = isIdentified
        self.dateTaken = dateTaken
    }
}
