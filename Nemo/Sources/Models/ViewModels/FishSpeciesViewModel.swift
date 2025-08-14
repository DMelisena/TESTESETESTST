//
//  FishSpeciesViewModel.swift
//  FindingNemo
//
//  Created by IP Marry Kusuma on 13/08/25.
//

import Foundation
import SwiftData
import SwiftUI

@Observable
final class FishSpeciesViewModel {
    private var modelContext: ModelContext?
    
    var items: [FishSpecies] = []
    var isLoading = false
    var errorMessage: String?
    
    func setModelContext(_ context: ModelContext) {
        self.modelContext = context
        fetchItems()
    }
    
    // MARK: - CRUD Operations
    
    func fetchItems() {
        guard let context = modelContext else { return }
        
        isLoading = true
        errorMessage = nil
        
        do {
            let descriptor = FetchDescriptor<FishSpecies>(
                sortBy: [SortDescriptor(\.familyName, order: .reverse)]
            )
            items = try context.fetch(descriptor)
        } catch {
            errorMessage = "Failed to fetch items: \(error.localizedDescription)"
        }
        
        isLoading = false
    }
    
    func addItem(familyName: String, speciesName: String) {
        guard let context = modelContext else { return }
        
        let newItem = FishSpecies(uid: UUID(), familyName: familyName, speciesName: speciesName)
        context.insert(newItem)
        
        do {
            try context.save()
            fetchItems()
        } catch {
            errorMessage = "Failed to add item: \(error.localizedDescription)"
        }
    }
    
    func updateItem(_ item: FishSpecies, familyName: String? = nil, speciesName: String? = nil) {
        guard let context = modelContext else { return }
        
        if let familyName = familyName {
            item.familyName = familyName
        }
        
        if let speciesName = speciesName {
            item.speciesName = speciesName
        }
        
        do {
            try context.save()
            fetchItems()
        } catch {
            errorMessage = "Failed to update item: \(error.localizedDescription)"
        }
    }
    
    func deleteItem(_ item: FishSpecies) {
        guard let context = modelContext else { return }
        
        context.delete(item)
        
        do {
            try context.save()
            fetchItems()
        } catch {
            errorMessage = "Failed to delete item: \(error.localizedDescription)"
        }
    }
    
    func toggleItemCompletion(_ item: FishSpecies) {
        updateItem(item)
    }
}
