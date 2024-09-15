//
//  ModelContainerBuilder.swift
//  MoviesChallenge
//
//  Created by Adriana Gutierrez on 14/09/24.
//

import Foundation
import SwiftData

protocol ModelContainerBuilderType {
    func build() -> ModelContainer
    
}

//struct ModelContainerBuilder: ModelContainerBuilderType {
//    private var schema: ModelConfiguration
//    
//        func build() -> ModelContainer {
//            ModelContainer(for: <#T##any PersistentModel.Type...##any PersistentModel.Type#>, configurations: <#T##ModelConfiguration...##ModelConfiguration#>)
//        }
//}

