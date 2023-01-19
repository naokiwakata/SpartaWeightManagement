import FirebaseFirestore
import FirebaseFirestoreSwift
import Combine

class UsersRepository: ObservableObject {
    @Published var users = [User]()
    private let path: String = "users"
    private let firestore = Firestore.firestore()
    
    func fetchUsers() {
        firestore.collection(path)
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        print("\(document.documentID) => \(document.data())")
                    }
                }
            }
    }
}
