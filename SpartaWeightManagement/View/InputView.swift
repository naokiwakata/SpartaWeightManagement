import SwiftUI

struct InputView: View {
    @ObservedObject private var inputViewModel = InputViewModel()
    @State private var weight:Double = 0.0
    
    var body: some View {
        VStack {
            TextField("体重入力", value: $weight, formatter: NumberFormatter())
            Button("保存") {
                Task{
                    let newWeight = Weight(weight: weight, date: Date.now)
                    try await inputViewModel.addWeight(newWeight: newWeight)
                }
            
            }
        }
    }
}

struct InputView_Previews: PreviewProvider {
    static var previews: some View {
        InputView()
    }
}
