import SwiftUI
import FirebaseCore


@main
struct SpartaWeightManagementApp: App {
    @StateObject private var modelData = ModelData()
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
                    .environmentObject(modelData)
                
            }
        }
    }
}
