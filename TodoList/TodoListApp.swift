//
//  TodoListApp.swift
//  TodoList
//
//  Created by Олексій Гаєвський on 21.07.2023.
//

import SwiftUI

@main
struct TodoListApp: App {
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationStack(){
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
