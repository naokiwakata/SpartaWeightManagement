import FirebaseFirestoreSwift
import Foundation

class Weight{
    let weight: Double
    let date: Date
    
    init(weight:Double,date:Date){
        self.weight = weight
        self.date = date
    }
}
