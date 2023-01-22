import FirebaseFirestore
import FirebaseFirestoreSwift
import Combine

class WeightsRepository: ObservableObject {
    private let path: String = "weights"
    private let firestore = Firestore.firestore()
    
    // クロージャーを使用した非同期処理
    func fetchWeights(userId:String,completion: @escaping ([Weight]) -> Void) {
        var weights: [Weight] = []
        firestore.collection("users").document(userId).collection(path)
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
