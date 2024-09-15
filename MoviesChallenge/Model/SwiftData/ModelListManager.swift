//
//  EntityManager.swift
//  MoviesChallenge
//
//  Created by Adriana Gutierrez on 14/09/24.
//

import Foundation
import Combine
import SwiftData


final class ModelListManager<ModelType: PersistentModel> {
    // MARK: Properties Declaration
    private let modelContext: ModelContext
    private let fetchDescriptor: FetchDescriptor<ModelType>
    
    let list = CurrentValueSubject<[ModelType], Never>([])
    
    // MARK: Initializers
    init(modelContext: ModelContext, fetchDescriptor: FetchDescriptor<ModelType>) {
        self.modelContext = modelContext
        self.fetchDescriptor = fetchDescriptor

     //   updateListValue()
    }
    
    // MARK: Public Methods
    func insert(_ model: ModelType) {
        modelContext.insert(model)
        updateListValue()
    }
    
    func delete(_ model: ModelType) {
        modelContext.delete(model)
        updateListValue()
    }
    
    func checkUpdates() {
        do {
            let currentValue = try modelContext.fetch(fetchDescriptor)
            
            guard currentValue != list.value else { return }
            list.send(currentValue)
        } catch {
            debugPrint(error)
        }
    }
    
    // MARK: Private Methods
    private func updateListValue() {
        do {
            if modelContext.hasChanges {
                try modelContext.save()
            }

            list.send(try modelContext.fetch(fetchDescriptor))
        } catch {
            debugPrint(error)
        }
    }
}
