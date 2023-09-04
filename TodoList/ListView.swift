//
//  ListView.swift
//  TodoList
//
//  Created by Олексій Гаєвський on 21.07.2023.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var ListViewModel: ListViewModel
    
    var body: some View {
        List{
            ForEach(ListViewModel.items) { item in
            ListRowView(item: item)
                    .onTapGesture {
                        withAnimation(.linear){
                            ListViewModel.updateComplete(item: item)
                        }
                    }
                    
            }
            .onDelete(perform: ListViewModel.deleteItem)
            .onMove(perform: ListViewModel.moveItem)
           
        }
        .listStyle(InsetGroupedListStyle())
        .navigationTitle("To do List✍🏻")
        .navigationBarItems(
            leading: EditButton(),
            trailing: NavigationLink("Add", destination: AddView())
        )
    }
  
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ListView()
        }
        .environmentObject(ListViewModel())
    }
}


