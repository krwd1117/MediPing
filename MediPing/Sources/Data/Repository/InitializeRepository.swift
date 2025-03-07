import Foundation
import MediPingDomain
import MediPingCore

public final class InitializeImpl: InitializeRepository {
    private let networkService: NetworkService
    
    public init(networkService: NetworkService = URLSessionNetworkService()) {
        self.networkService = networkService
    }
    
    public func fetchInitialData() async throws {
        try await networkService.request(endpoint: APIEndpoint.initialize)
    }
} 
