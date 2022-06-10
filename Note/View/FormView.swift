//
//  FormView.swift
//  Note
//
//  Created by Sullivan De carli on 23/05/2022.
//

import SwiftUI
import FirebaseStorage

struct FormView: View {
    
    @Environment(\.dismiss) var dismiss
    @ObservedObject private var viewModel = NoteViewModel()
    @State var title = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextEditor(text: $title)
                        .frame(minHeight: 200)
                }
                Section {
                    Button(action: {
                        self.viewModel.addData(title: title)
                        dismiss()
                    }) {
                        Text("Save now")
                    }.disabled(self.title.isEmpty)
                        .foregroundColor(.yellow)
                }
            }.navigationTitle("Publish")
                .toolbar {
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                        Button("Cancel") {
                            dismiss()
                        }.foregroundColor(.yellow)
                    }
                }
        }
    }
}

struct FormView_Previews: PreviewProvider {
    static var previews: some View {
        FormView()
    }
}
