//
//  APIConnector.swift
//  Marvel
//
//  Created by Chantal de Leste Conde on 26/7/22.
//

import UIKit
import CommonCrypto


public enum HTTPMethod: String {
    case post = "POST"
    case put = "PUT"
    case get = "GET"
    case delete = "DELETE"
    case patch = "PATCH"
}

enum NetworkError: Error {
    case badInput
    case noData
    case requestBuilderFailed
}

protocol RequestProtocol {
    var baseURL: URL { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var urlParameters: [URLQueryItem]? { get }
    var body: Encodable? { get }
}

extension RequestProtocol {
    
    var baseURL: URL {
        guard let url = URL(string: APIEnvironment.apiBaseURL) else {
            fatalError("No se puede formar la url.")
        }
        return url
    }
    
    var completeUrl: URL {
        baseURL.appendingPathComponent(path)
    }
    
    public var urlParameters: [URLQueryItem]? {
        return [URLQueryItem(name: "ts", value: API.timeStamp),
                URLQueryItem(name: "apikey", value: API.publicKey),
                URLQueryItem(name: "hash", value: API.hash)]
    }

    
    func urlRequest() -> URLRequest {
        
        var urlRequest = URLRequest(url: completeUrl,
                                    cachePolicy: .reloadIgnoringLocalAndRemoteCacheData,
                                    timeoutInterval: 100)
        urlRequest.httpMethod = method.rawValue
        
        do {
            if let parameters = urlParameters {
                urlRequest = try buildURLRequestParams(urlRequest, params: parameters)
            }
        } catch {
            print("Can't build parameters request")
        }
        
        return urlRequest
    }
    
    private func buildURLRequestParams(_ urlRequest: URLRequest, params: [URLQueryItem]?) throws -> URLRequest {
        var urlRequest = urlRequest
        let full_url = urlRequest.url?.absoluteString ?? ""
        
        if let parameters = params {
            guard var components = URLComponents(string: full_url) else {
                throw NetworkError.badInput
            }
            components.queryItems = parameters
            urlRequest.url = components.url
        } else {
            throw NetworkError.badInput
        }
        
        return urlRequest
    }
    
}

struct API {
    static var hash: String { "\(timeStamp)\(privateKey)\(publicKey)".md5 }
    static var publicKey: String { "f78cb691980772985d58459d226053b8" }
    static var privateKey: String { "5b2dac4c84dedb2364bcd34935d8fcead3cb488b" }
    static var timeStamp: String { formatter.string(from: Date())}
    private static let formatter: DateFormatter = {
        let form = DateFormatter()
        form.dateFormat = "yyyyMMddHHmmss"
        return form
        
    }()
}
    


extension String {
    var md5: String {
            let data = Data(self.utf8)
            let hash = data.withUnsafeBytes { (bytes: UnsafeRawBufferPointer) -> [UInt8] in
                var hash = [UInt8](repeating: 0, count: Int(CC_MD5_DIGEST_LENGTH))
                CC_MD5(bytes.baseAddress, CC_LONG(data.count), &hash)
                return hash
            }
            return hash.map { String(format: "%02x", $0) }.joined()
    }
}
