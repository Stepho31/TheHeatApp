import SwiftUI
import Firebase

@main
struct SwiftUI_List_StarterApp: App {

    @StateObject var viewModel = AuthViewModel()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                
                ContentView()
                
            }
            .environmentObject(viewModel)
            .environmentObject(FollowServiceManager())
    }
}
}
