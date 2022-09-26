//
//  ContentView.swift
//  Note
//
//  Created by Sullivan De carli on 23/05/2022.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var viewModel = NoteViewModel()
    @State private var presentAlert = false
    @State private var titleText: String = ""
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.notes, id:\.id) { Note in
                    NavigationLink(destination: DetailsView(note: Note)) {
                        VStack(alignment: .leading) {
                            Text(Note.title ?? "").font(.system(size: 22, weight: .regular))
                        }.frame(maxHeight: 200)
                    }
                }.onDelete(perform: self.viewModel.deleteData(at:))
            }.onAppear(perform: self.viewModel.fetchData)
                .navigationTitle("Notes")
        }.accentColor(.yellow)
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Text("\(viewModel.notes.count) notes")
                }
                ToolbarItem(placement: .bottomBar) {
                    Button {
                        presentAlert = true
                    } label: {
                        Image(systemName: "square.and.pencil")
                            .imageScale(.large)
                            .bold()
                            .accentColor(.yellow)
                    }.alert("Note", isPresented: $presentAlert, actions: {
                        TextField("Enter your text", text: $titleText)
                        Button("Save", action: {
                            // post the text to Firestore, then erase the text:
                            self.viewModel.addData(title: titleText)
                            titleText = ""
                        })
                        Button("Cancel", role: .cancel, action: {
                            presentAlert = false
                            titleText = ""
                        })
                    }, message: {
                        Text("Please, write your note")
                    })
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
