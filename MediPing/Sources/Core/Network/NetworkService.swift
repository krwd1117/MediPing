import Foundation

public protocol NetworkService {
    func request<T: Decodable>(endpoint: Endpoint) async throws -> T
    func request(endpoint: Endpoint) async throws
}

public final class URLSessionNetworkService: NetworkService {
    private let session: URLSession
    private let decoder: JSONDecoder
    
    public init(
        session: URLSession = .shared,
        decoder: JSONDecoder = .init()
    ) {
        self.session = session
        self.decoder = decoder
    }
    
    public func request<T: Decodable>(endpoint: Endpoint) async throws -> T {
        let request = try endpoint.makeRequest()
        let (data, response) = try await session.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }
        
        guard (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.statusCode(httpResponse.statusCode)
        }
        
        return try decoder.decode(T.self, from: data)
    }
    
    public func request(endpoint: Endpoint) async throws {
        let request = try endpoint.makeRequest()
        let (_, response) = try await session.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }
        
        guard (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.statusCode(httpResponse.statusCode)
        }
    }
} 