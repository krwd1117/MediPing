import Foundation
import UserNotifications

public final class NotificationManager {
    public static let shared = NotificationManager()
    
    private init() {}
    
    public func requestAuthorization() async throws {
        let center = UNUserNotificationCenter.current()
        try await center.requestAuthorization(options: [.alert, .sound, .badge])
    }
} 
