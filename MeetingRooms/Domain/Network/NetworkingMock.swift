// Copyright © 2022 Vertica A/S. All rights reserved.

import Foundation

struct NetworkingMock: Networking {
    private let dummyUrl = URL(string: "https://www.w3.org/Provider/Style/dummy.html")!

    let json: String

    func data(for _: URLRequest, delegate _: URLSessionTaskDelegate?) async throws -> (Data, URLResponse) {
        let data = Data(json.utf8)
        let response = HTTPURLResponse(url: dummyUrl, mimeType: nil, expectedContentLength: data.count, textEncodingName: nil)
        return (data, response)
    }
}
