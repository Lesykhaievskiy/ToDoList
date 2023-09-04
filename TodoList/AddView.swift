//
//  AddView.swift
//  TodoList
//
//  Created by Олексій Гаєвський on 24.07.2023.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textfieldText: String = ""
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    var body: some View {
        ScrollView{
            VStack {
                TextField("Write something...", text: $textfieldText)
                    .padding(.horizontal)
                    .frame(height: 50)
                    .background(Color(hue: 1.0, saturation: 0.027, brightness: 0.925))
                .cornerRadius(6)
                Button(action: saveButtonPressed, label:  {
                    Text("Save" .uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .frame(height: 55)
                        .background(Color.accentColor) .cornerRadius(6)
                        
                })
            }
            .padding(14)
                
        }
        
            .navigationTitle("Add new Item✍🏻")
            .alert(isPresented: $showAlert, content: getAlert) 
    }
    func saveButtonPressed(){
        if textIsApproriate(){
            listViewModel.addItem(title: textfieldText)
            presentationMode.wrappedValue.dismiss()
        }   
    }
    func textIsApproriate() -> Bool{
        if textfieldText.count < 3 {
            alertTitle = "Oops. Your todo item must be at least 3 characters long"
            showAlert.toggle()
            return false
        }
        return true
    }
    func getAlert() -> Alert{
        return Alert(title: Text(alertTitle ))
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            AddView()
        }
        .environmentObject(ListViewModel())
    }
}
