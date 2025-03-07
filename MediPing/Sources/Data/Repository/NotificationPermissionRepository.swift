//
//  NotificationPermissionRepository.swift
//  MediPing
//
//  Created by 김정완 on 3/8/25.
//

import MediPingDomain
import MediPingCore

class NotificationPermissionRepositoryImpe: NotificationPermissionRepository {
    
    func requestAuthorization() async throws {
        try await NotificationManager.shared.requestAuthorization()
    }
}
