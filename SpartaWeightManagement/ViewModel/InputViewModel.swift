import Combine

class InputViewModel: ObservableObject {
    
    @Published var weightsRepository = WeightsRepository()
    var weights:[Weight] = []
    
    
    func fetch() {
        weightsRepository.fetchWeights{ (weights) in
            self.weights = weights
        }
    }
    
    func addWeight(newWeight : Weight){
        weights.append(newWeight)
        print(weights)
    }
}
