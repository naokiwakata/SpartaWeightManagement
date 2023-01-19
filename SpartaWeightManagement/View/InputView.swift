import SwiftUI

struct InputView: View {
    @ObservedObject private var inputViewModel = InputViewModel()

    init(){
        inputViewModel.fetch()
    }
    var body: some View {
        Color.yellow
            .ignoresSafeArea(edges:[.top])
    }
}

struct InputView_Previews: PreviewProvider {
    static var previews: some View {
        InputView()
    }
}
