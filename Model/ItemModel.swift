//
//  ItemModel.swift
//  TodoList
//
//  Created by Олексій Гаєвський on 24.07.2023.
//

import Foundation

struct itemModel: Identifiable, Codable{
    let title: String
    let isCompleted: Bool
    let id: String
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool){
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    func updateCompletion() -> itemModel{
        return itemModel(id: id, title: title, isCompleted: !isCompleted)
    }
}
