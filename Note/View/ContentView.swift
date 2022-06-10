//
//  ContentView.swift
//  Note
//
//  Created by Sullivan De carli on 23/05/2022.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var viewModel = NoteViewModel()
    @State private var showingSheet = false
    
    var body: some View {
        NavigationView {
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
                ToolbarItemGroup(placement: .bottomBar) {
                    Text("\(viewModel.notes.count) notes")
                Spacer()
                Button {
                    showingSheet.toggle()
                } label: {
                    Image(systemName: "square.and.pencil")
                }.foregroundColor(.yellow)
                 .font(.system(size: 22, weight: .medium))
                 .sheet(isPresented: $showingSheet) {
                    FormView()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
