import Foundation
import MediPingDomain
import UserNotifications

@MainActor
public final class SplashViewModel: ObservableObject {
    @Published public var isInitialized: Bool = false
    @Published public var error: Error?
    
    private let notificationPermissionUseCase: NotificationPermissionRepository
    private let initializeUseCase: InitializeRepository
    
    public init(
        notificationPermissionUseCase: NotificationPermissionRepository,
        initializeUseCase: InitializeRepository
    ) {
        self.notificationPermissionUseCase = notificationPermissionUseCase
        self.initializeUseCase = initializeUseCase
    }
    
    func checkPermissions() {
        Task {
            do {
                // 알림 권한 요청
                try await notificationPermissionUseCase.requestAuthorization()
                
                // 초기 데이터 로드
//                try await initializeUseCase.fetchInitialData()
                
                // 모든 초기화가 완료되면 상태 업데이트
                isInitialized = true
            } catch {
                self.error = error
                print("초기화 실패: \(error.localizedDescription)")
            }
        }
    }
} 
