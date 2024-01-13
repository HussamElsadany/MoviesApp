//
//  NetworkClientProtocol.swift
//
//
//  Created by Hussam Elsadany on 12/01/2024.
//

import Combine

public protocol NetworkClientProtocol {
    /// Sends an HTTP request to the specified endpoint and decodes the response into a decodable type.
    ///
    /// - Parameters:
    ///   - response: The decodable type that the HTTP response should be decoded into.
    ///   - endpoint: The endpoint representing the details of the HTTP request.
    ///
    /// - Returns: A Combine `AnyPublisher` that emits the decoded response or an error.
    func send<Response: Decodable>(
        _ response: Response.Type,
        endpoint: HTTPEndpoint
    ) -> AnyPublisher<Response, Error>
}
