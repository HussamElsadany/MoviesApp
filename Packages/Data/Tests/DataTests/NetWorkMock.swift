//
//  NetWorkMock.swift
//
//
//  Created by Hussam Elsadany on 14/01/2024.
//

import Domain
import CoreNetwork
import Combine

class NetWorkMock: NetworkClientProtocol {
    
    let mockedObject: Decodable
    
    init(mockedObject: Decodable) {
        self.mockedObject = mockedObject
    }
    
    func send<Response: Decodable>(
        _ response: Response.Type,
        endpoint: HTTPEndpoint
    ) -> AnyPublisher<Response, Error> {
        return Just(mockedObject as! Response)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
