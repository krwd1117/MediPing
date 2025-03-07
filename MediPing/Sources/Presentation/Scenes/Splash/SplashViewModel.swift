import Foundation
import MediPingDomain
import UserNotifications

@MainActor
final class SplashViewModel: ObservableObject {
    @Published var isInitialized: Bool = false
    private let notificationPermissionUseCase: NotificationPermissionUseCase
    
    init(notificationPermissionUseCase: NotificationPermissionUseCase = DefaultNotificationPermissionUseCase()) {
        self.notificationPermissionUseCase = notificationPermissionUseCase
    }
    
    func checkPermissions() {
        Task {
            do {
                try await notificationPermissionUseCase.requestAuthorization()
                isInitialized = true
            } catch {
                print("알림 권한 요청 실패: \(error.localizedDescription)")
                isInitialized = true // 실패해도 앱은 계속 진행
            }
        }
    }
} 