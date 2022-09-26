//
//  DetailsView.swift
//  Note
//
//  Created by Sullivan De carli on 23/05/2022.
//

import SwiftUI

struct DetailsView: View {
    
    @State private var presentAlert = false
    @State private var titleText: String = ""
    @ObservedObject private var viewModel = NoteViewModel()
    var note: Note
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    Text(note.title ?? "")
                        .font(.system(size: 22, weight: .regular))
                        .padding()
                    
                    Spacer()
                }
            }
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button {
                        presentAlert = true
                    } label: {
                        Text("Edit")
                            .bold()
                            .accentColor(.yellow)
                    }.alert("Update your note", isPresented: $presentAlert, actions: {
                        TextField("Enter your new text", text: $titleText)
                        
                        Button("Update", action: {
                            // post the text to Firestore, then erase the text:
                            self.viewModel.updateData(title: titleText, id: note.id!)
                            titleText = ""
                        })
                        Button("Cancel", role: .cancel, action: {
                            presentAlert = false
                            titleText = ""
                        })
                    }, message: {
                        Text("Please, enter your new note")
                    })
                }
            }
        }.navigationTitle("Details")
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(note: Note(id: "bKrivNkYirmMvHyAUBWv", title: "Issues are never simple. One thing I'm proud of is that very rarely will you hear me simplify the issues.Barack Obama"))
    }
}
