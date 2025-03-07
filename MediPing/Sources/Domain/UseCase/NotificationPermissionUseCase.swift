import Foundation
import MediPingCore

public protocol NotificationPermission {
    func requestAuthorization() async throws
}

public final class NotificationPermissionUseCase: NotificationPermission {
    public init() {}
    
    public func requestAuthorization() async throws {
        try await NotificationManager.shared.requestAuthorization()
    }
} 
