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
    
    func fetchUser(userId:String) async throws -> DocumentSnapshot{
        let document:DocumentSnapshot = try await firestore.collection(path).document(userId).getDocument()
        return document
    }
    
    func createUser(userId:String) async throws {
        try await firestore.collection(path).document(userId).setData(["userId":userId,"createdAt":Date.now])
    }
}
