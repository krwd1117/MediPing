import SwiftUI
import MediPingPresentation

@main
struct MediPingApp: App {
    @StateObject private var appState = AppState()
    
    var body: some Scene {
        WindowGroup {
            Group {
                if appState.isInitialized {
                    MainView()
                } else {
                    SplashView()
                        .environmentObject(appState)
                }
            }
        }
    }
}

final class AppState: ObservableObject {
    @Published var isInitialized: Bool = false
} 