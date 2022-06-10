//
//  EditView.swift
//  Note
//
//  Created by Sullivan De carli on 24/05/2022.
//

import SwiftUI

struct EditView: View {
    
    @Environment(\.dismiss) var dismiss
    @ObservedObject private var viewModel = NoteViewModel()
    @State var title = ""
    var note: Note
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextEditor(text: $title)
                        .frame(minHeight: 200)
                }
                Section {
                    Button(action: {
                        self.viewModel.updateData(title: title, id: note.id ?? "")
                        dismiss()
                    }) {
                        Text("Update now")
                    }.disabled(self.title.isEmpty)
                        .foregroundColor(.yellow)
                }
            }.navigationTitle("Update")
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

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView(note: Note(id: "bKrivNkYirmMvHyAUBWv", title: "Issues are never simple. One thing I'm proud of is that very rarely will you hear me simplify the issues.Barack Obama"))
    }
}
