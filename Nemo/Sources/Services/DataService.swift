//
//  DataService.swift
//  FindingNemo
//
//  Created by IP Marry Kusuma on 13/08/25.
//

import Foundation
import SwiftData

protocol DataServiceProtocol {
    func save() throws
    func fetch<T: PersistentModel>(_ type: T.Type, predicate: Predicate<T>?, sortBy: [SortDescriptor<T>]) throws -> [T]
    func insert<T: PersistentModel>(_ object: T)
    func delete<T: PersistentModel>(_ object: T)
}

final class DataService: DataServiceProtocol {
    private let modelContext: ModelContext
    
    init(modelContext: ModelContext) {
        self.modelContext = modelContext
    }
    
    func save() throws {
        try modelContext.save()
    }
    
    func fetch<T: PersistentModel>(_ type: T.Type, predicate: Predicate<T>? = nil, sortBy: [SortDescriptor<T>] = []) throws -> [T] {
        let descriptor = FetchDescriptor<T>(predicate: predicate, sortBy: sortBy)
        return try modelContext.fetch(descriptor)
    }
    
    func insert<T: PersistentModel>(_ object: T) {
        modelContext.insert(object)
    }
    
    func delete<T: PersistentModel>(_ object: T) {
        modelContext.delete(object)
    }
}
