import SwiftUI
import MediPingPresentation
import MediPingDomain

@main
struct MediPingApp: App {
    @State private var isInitialized: Bool = false
    
    var body: some Scene {
        WindowGroup {
            if isInitialized {
                MainView()
            } else {
                let viewModel = SplashViewModel(
                    notificationPermissionUseCase: NotificationPermissionRepositoryImpe(),
                    initializeUseCase: InitializeImpl()
                )
                SplashView(viewModel: viewModel, isInitialized: $isInitialized)
            }
        }
    }
}
