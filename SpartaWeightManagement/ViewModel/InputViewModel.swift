import Combine
import Foundation

class InputViewModel: ObservableObject {
    
    @Published var weightsRepository = WeightsRepository()
    var weights:[Weight] = []
    var selectedWeight: Weight?
    
    init(){
        fetch()
    }
    
    // weightsの取得および今日のweightがあれば取り出す
    func fetch() {
        weightsRepository.fetchWeights{ (weights) in
            self.weights = weights
            self.selectedWeight = self.selectWeight(date: Date.now)
            print(self.selectedWeight ?? "なし")
        }
    }
    
    // weightsから指定した日付のweightを取り出す
    func selectWeight(date:Date) -> Weight? {
        let selectedWeight = self.weights.first(where: {$0.isSameDayWeight(date: date)})
        return selectedWeight
    }
    
    // firestoreに体重を保存
    
    func addWeight(newWeight : Weight){
        weights.append(newWeight)
        print(weights)
    }
}
