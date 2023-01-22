import FirebaseFirestore
import FirebaseFirestoreSwift
import Combine
import FirebaseAuth

final class AuthRepository: ObservableObject {
    
    private init(){}
    
    public static let shared = AuthRepository()
    
    private var user : FirebaseAuth.User?
    
    func signInAnonymously(){
        Auth.auth().signInAnonymously() { authResult, error in
            guard let user = authResult?.user else {
                return
            }
            self.user = user
            print(user.uid)
        }
    }
    
    func signInAnonymously2() async throws {
        let result = try await Auth.auth().signInAnonymously()
        self.user = result.user
    }
    
    func getCurrentUser() async throws -> FirebaseAuth.User{
        if self.user == nil{
          try await signInAnonymously2()
        }
        
        return self.user!
    }
    
    
}
