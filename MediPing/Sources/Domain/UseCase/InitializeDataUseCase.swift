import Foundation

public protocol InitializeRepository {
    func fetchInitialData() async throws
}

public final class InitializeDataUseCase: InitializeRepository {
    private let repository: InitializeRepository
    
    public init(repository: InitializeRepository) {
        self.repository = repository
    }
    
    public func fetchInitialData() async throws {
        try await repository.fetchInitialData()
    }
} 
