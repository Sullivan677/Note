//
//  DetailsView.swift
//  Note
//
//  Created by Sullivan De carli on 23/05/2022.
//

import SwiftUI

struct DetailsView: View {
    
    @State private var showingSheet = false
    var note: Note
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Text(note.title ?? "")
                        .font(.system(size: 22, weight: .regular))
                        .padding()
                    
                    Spacer()
                }
            }
            
        }.navigationTitle("Details")
        .navigationBarItems(trailing:
                                Button(action: {
            showingSheet.toggle()
        }) {
            Text("Edit").bold()
        }.sheet(isPresented: $showingSheet) {
            EditView(note: note)
        }
        )
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(note: Note(id: "bKrivNkYirmMvHyAUBWv", title: "Issues are never simple. One thing I'm proud of is that very rarely will you hear me simplify the issues.Barack Obama"))
    }
}
