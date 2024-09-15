//
//  EntityManager.swift
//  MoviesChallenge
//
//  Created by Adriana Gutierrez on 14/09/24.
//

import Foundation
import Combine
import SwiftData

protocol ModelListManagerType {
    associatedtype ModelType
    
    var list: CurrentValueSubject<[ModelType], Never> { get }

    func insert(_ entity: ModelType)
}

final class ModelListManager<ModelType: PersistentModel>: ModelListManagerType {
    // MARK: Properties Declaration
    private let modelContext: ModelContext
    private let fetchDescriptor: FetchDescriptor<ModelType>
    
    let list = CurrentValueSubject<[ModelType], Never>([])
    
    // MARK: Initializers
    private init(modelContext: ModelContext, fetchDescriptor: FetchDescriptor<ModelType>) {
        self.modelContext = modelContext
        self.fetchDescriptor = fetchDescriptor

        updateListValue()
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
    
    // MARK: Private Methods
    private func updateListValue() {
        do {
            list.send(try modelContext.fetch(fetchDescriptor))
        } catch {
            debugPrint(error)
        }
    }
}
