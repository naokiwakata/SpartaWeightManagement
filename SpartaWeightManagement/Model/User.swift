import FirebaseFirestoreSwift
import SwiftUI

struct User: Codable {
    @DocumentID var id: String? // @DocumentID to fetch the identifier from Firestore
    var title: String?
}
