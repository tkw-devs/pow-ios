//
//  URLProtocolMock.swift
//  PoqTests
//
//  Copyright © 2020 Tecknoworks srl. All rights reserved.
//

import Foundation

class URLProtocolMock: URLProtocol {
    static var data: Data? = Data()

    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }

    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }

    override func startLoading() {
        if let data = URLProtocolMock.data {
            self.client?.urlProtocol(self, didLoad: data)
        }
        self.client?.urlProtocolDidFinishLoading(self)
    }

    override func stopLoading() {}
}
