import SwiftUI

struct TopView: View {
    var body: some View {
        TabView {
            InputView()
                .tabItem {
                    VStack {
                        Image(systemName: "person.fill")
                        Text("メイン")
                    }
                }
            GraphView()
                .tabItem {
                    VStack {
                        Image(systemName: "waveform.path.ecg")
                        Text("グラフ")
                    }
                }
        }
        
    }
}

struct TopView_Previews: PreviewProvider {
    static var previews: some View {
        TopView()
    }
}
