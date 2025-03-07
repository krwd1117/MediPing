import Foundation

public protocol NotificationPermissionUseCase {
    func requestAuthorization() async throws
}

public final class DefaultNotificationPermissionUseCase: NotificationPermissionUseCase {
    public init() {}
    
    public func requestAuthorization() async throws {
        try await NotificationManager.shared.requestAuthorization()
    }
} 