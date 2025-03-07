import Foundation
import MediPingDomain
import UserNotifications

@MainActor
public final class SplashViewModel: ObservableObject {
    @Published public var isInitialized: Bool = false
    
    private let notificationPermissionUseCase: NotificationPermissionUseCase
    
    public init(
        notificationPermissionUseCase: NotificationPermissionUseCase = NotificationPermissionUseCase()
    ) {
        self.notificationPermissionUseCase = notificationPermissionUseCase
    }
    
    func checkPermissions() {
        Task {
            do {
                try await notificationPermissionUseCase.requestAuthorization()
                try? await Task.sleep(for: .seconds(1))
                isInitialized = true
            } catch {
                print("알림 권한 요청 실패: \(error.localizedDescription)")
                isInitialized = true // 실패해도 앱은 계속 진행
            }
        }
    }
} 
