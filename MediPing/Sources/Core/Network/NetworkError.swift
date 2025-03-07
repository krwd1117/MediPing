 
import Foundation

public enum NetworkError: LocalizedError {
    case invalidURL
    case invalidResponse
    case statusCode(Int)
    case decodingError(Error)
    case unknown(Error)
    
    public var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "잘못된 URL입니다."
        case .invalidResponse:
            return "잘못된 응답입니다."
        case .statusCode(let code):
            return "서버 오류가 발생했습니다. (상태 코드: \(code))"
        case .decodingError(let error):
            return "데이터 변환 중 오류가 발생했습니다. (\(error.localizedDescription))"
        case .unknown(let error):
            return "알 수 없는 오류가 발생했습니다. (\(error.localizedDescription))"
        }
    }
}
