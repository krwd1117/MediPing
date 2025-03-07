import Foundation

public protocol Endpoint {
    var baseURL: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: [String: String]? { get }
    var parameters: [String: Any]? { get }
}

public extension Endpoint {
    var baseURL: String {
        // TODO: 환경에 따른 baseURL 설정
        return "https://api.mediping.com"
    }
    
    var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }
    
    var parameters: [String: Any]? {
        return nil
    }
    
    func makeRequest() throws -> URLRequest {
        guard let url = URL(string: baseURL + path) else {
            throw NetworkError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = headers
        
        if let parameters = parameters {
            switch method {
            case .get:
                var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
                components?.queryItems = parameters.map { 
                    URLQueryItem(name: $0.key, value: "\($0.value)")
                }
                request.url = components?.url
            case .post, .put, .patch:
                request.httpBody = try JSONSerialization.data(withJSONObject: parameters)
            default:
                break
            }
        }
        
        return request
    }
} 