import SwiftUI
import FirebaseCore


@main
struct SpartaWeightManagementApp: App {
    @StateObject private var modelData = ModelData()
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
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

class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        // 起動時に1回だけやる処理をここに記述する
        AuthRepository.shared.signInAnonymously()
        
        Task.init {
            try await AuthRepository.shared.signInAnonymously2()
            let user = try await AuthRepository.shared.getCurrentUser()
            let doc = try await UsersRepository().fetchUser(userId: user.uid)
            if(!doc.exists){
                try await UsersRepository().createUser(userId: user.uid)
                print("create new user doc!")
            }else{
                print("user doc have alredy created")
            }
        }
        return true
    }
}
