import Combine
import Foundation

class InputViewModel: ObservableObject {
    
    @Published var weightsRepository = WeightsRepository()
    var weights:[Weight] = []
    var selectedWeight: Weight?
    
    init(){
        Task.init{
            try await fetch()
        }
    }
    
    // weightsの取得および今日のweightがあれば取り出す
    func fetch() async throws{
        let user = try await AuthRepository.shared.getCurrentUser()
        weightsRepository.fetchWeights(userId:user.uid){ (weights) in
            self.weights = weights
            self.selectedWeight = self.selectWeight(date: Date.now)
            print(self.selectedWeight ?? "なし")
            print(weights)
        }
    }
    
    // weightsから指定した日付のweightを取り出す
    func selectWeight(date:Date) -> Weight? {
        let selectedWeight = self.weights.first(where: {$0.isSameDayWeight(date: date)})
        return selectedWeight
    }
    
    // firestoreに体重を保存
    func addWeight(newWeight : Weight)async throws{
        let user = try await AuthRepository.shared.getCurrentUser()
        try await weightsRepository.addWeight(userId: user.uid, weight: newWeight.weight,date:newWeight.date)
        weights.append(newWeight)
        print(weights)
    }
}
