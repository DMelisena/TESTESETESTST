//
//  Project.swift
//  FindingNemo
//
//  Created by IP Marry Kusuma on 13/08/25.
//

import Foundation
import SwiftData

@Model
final class Project {
    @Attribute(.unique) var uid: UUID
    var name: String
    var videoFilename: String
    var dateCreated: Date
    var dateTaken: Date
    
    init(uid: UUID, name: String, videoFilename: String, dateCreated: Date, dateTaken: Date) {
        self.uid = uid
        self.name = name
        self.videoFilename = videoFilename
        self.dateCreated = dateCreated
        self.dateTaken = dateTaken
    }
}
