//
//  Note.swift
//  Note
//
//  Created by Sullivan De carli on 23/05/2022.
//

import Foundation
import FirebaseFirestoreSwift
import SwiftUI

struct Note: Codable {
    @DocumentID var id: String? // @DocumentID to fetch the identifier from Firestore
    var title: String?
    var header: String?
}
