import FirebaseFirestore
import FirebaseFirestoreSwift
import Combine

class WeightsRepository: ObservableObject {
    private let path: String = "weights"
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
    
    func fetchWeights() async -> [Weight] {
        let weights: [Weight] = []
        
        
        do {
            let docs = try await firestore.collection(path).getDocuments()
            print(docs)
        } catch {
            print("fetch weights error")
        }
        
        return weights;
    }
    
    func fetchWeights2(completion: @escaping ([Weight]) -> Void) {
        var weights: [Weight] = []
        firestore.collection(path)
            .getDocuments(){ (snapshot,error) in
                if let error = error {
                    print("Error fetching data: \(error)")
                    return
                }
                guard let snapshot = snapshot else { return }
                for doc in snapshot.documents{
                    let data = doc.data()
                    guard let weight = data["weight"] as? Double,
                          let date = data["date"] as? Timestamp else {
                        continue
                    }
                    let newWeight = Weight(weight: weight, date: date.dateValue())
                    weights.append(newWeight)
                }
                completion(weights)
            }
    }

}
