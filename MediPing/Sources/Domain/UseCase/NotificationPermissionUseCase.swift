import Foundation
import MediPingCore

public protocol NotificationPermissionRepository {
    func requestAuthorization() async throws
}

public final class NotificationPermissionUseCase: NotificationPermissionRepository {
    private let repository: NotificationPermissionRepository
    
    public init(repository: NotificationPermissionRepository) {
        self.repository = repository
    }
    
    public func requestAuthorization() async throws {
        try await repository.requestAuthorization()
    }
} 
