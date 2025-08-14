//
//  FishSpecies.swift
//  FindingNemo
//
//  Created by IP Marry Kusuma on 13/08/25.
//

import Foundation
import SwiftData

@Model
final class FishSpecies {
    @Attribute(.unique) var uid: UUID
    var familyName: String
    var speciesName: String
    
    init(uid: UUID, familyName: String, speciesName: String) {
        self.uid = uid
        self.familyName = familyName
        self.speciesName = speciesName
    }
}
