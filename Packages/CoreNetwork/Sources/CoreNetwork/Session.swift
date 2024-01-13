//
//  Session.swift
//
//
//  Created by Hussam Elsadany on 12/01/2024.
//

import Foundation
import Combine

public class Session {
    public let session: URLSession
    
    public init(session: URLSession = .shared) {
        self.session = session
    }
}

extension Session: NetworkClientProtocol {
    public func send<Response>(
        _ response: Response.Type,
        endpoint: HTTPEndpoint
    ) -> AnyPublisher<Response, Error> where Response : Decodable {
        Future<Response, Error> { [weak self] closure in
            guard let self else {
                closure(.failure(NetworkError.operationCancelled))
                return
            }
            session.dataTask(with: endpoint.urlRequest) { [weak self] data, urlResponse, error in
                guard let self else {
                    closure(.failure(NetworkError.operationCancelled))
                    return
                }
                do {
                    let object = try self.decode(data: data, type: response)
                    closure(.success(object))
                } catch let error {
                    closure(.failure(error))
                }
            }
        }
        .eraseToAnyPublisher()
    }
}

private extension Session {
    func validate(response: URLResponse?, statusCodes: Range<Int>) throws {
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.unknownStatusCode
        }
        
        if !statusCodes.contains(httpResponse.statusCode) {
            throw NetworkError.unexpectedStatusCode(code: httpResponse.statusCode)
        }
    }
    
    func decode<T: Decodable>(data: Data?, type: T.Type) throws -> T {
        guard let data = data, !data.isEmpty else {
            throw NetworkError.contentEmptyData
        }
        
        do {
            return try JSONDecoder().decode(type, from: data)
        } catch {
            throw NetworkError.contentDecoding(error: error)
        }
    }
}
