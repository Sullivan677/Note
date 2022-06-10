//
//  NoteApp.swift
//  Note
//
//  Created by Sullivan De carli on 23/05/2022.
//

import SwiftUI
import Firebase

@main
struct NoteApp: App {
    
    init() {
        FirebaseApp.configure()
        }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
