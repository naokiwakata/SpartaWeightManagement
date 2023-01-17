import SwiftUI

struct ContentView: View {
    var body: some View {
        TopView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}

