// Copyright © 2022 Vertica A/S. All rights reserved.

import Foundation

struct NetworkManager {
    private let networking: Networking

    init(networking: Networking = URLSession.shared) {
        self.networking = networking
    }

    func request<T: Decodable>(_: T.Type = T.self,
                               url: URL,
                               method: HTTPMethod,
                               parameters: Parameters? = nil,
                               headers: Headers = Headers([:]),
                               encodingStrategy: JSONEncoder.KeyEncodingStrategy? = nil,
                               encodingFormatting: JSONEncoder.OutputFormatting? = nil,
                               dateEncodingStrategy: JSONEncoder.DateEncodingStrategy? = nil,
                               decodingStrategy: JSONDecoder.KeyDecodingStrategy? = nil,
                               dateDecodingStrategy: JSONDecoder.DateDecodingStrategy? = nil) async throws -> T
    {
        let request = try createRequest(url: url,
                                        method: method,
                                        parameters: parameters,
                                        headers: headers,
                                        encodingStrategy: encodingStrategy,
                                        encodingFormatting: encodingFormatting,
                                        dateEncodingStrategy: dateEncodingStrategy)

        let (data, response) = try await networking.data(for: request)

        return try handleResponse(T.self,
                                  url,
                                  data,
                                  response,
                                  decodingStrategy,
                                  dateDecodingStrategy)
    }

    private func createRequest(url: URL,
                               method: HTTPMethod,
                               parameters: Parameters?,
                               headers: Headers,
                               encodingStrategy: JSONEncoder.KeyEncodingStrategy?,
                               encodingFormatting: JSONEncoder.OutputFormatting?,
                               dateEncodingStrategy: JSONEncoder.DateEncodingStrategy?) throws -> URLRequest
    {
        var components = url.components()
        var httpBody: Data?

        switch method {
        case .get, .delete:
            components.queryItems = parameters?.urlQueryItems
        case .post:
            httpBody = parameters?.httpBody(with: encodingStrategy, with: encodingFormatting, with: dateEncodingStrategy)
        }

        guard let url = components.url else {
            throw NetworkManagerError.error(errorMessage: "components.url is nil")
        }

        var request = URLRequest(url: url)

        request.httpBody = httpBody
        request.httpMethod = method.rawValue
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")

        headers.forEach { key, value in
            request.addValue(value, forHTTPHeaderField: key)
        }

        return request
    }

    private func handleResponse<T: Decodable>(_: T.Type,
                                              _: URL,
                                              _ data: Data,
                                              _ response: URLResponse,
                                              _ decodingStrategy: JSONDecoder.KeyDecodingStrategy?,
                                              _ dateDecodingStrategy: JSONDecoder.DateDecodingStrategy?) throws -> T
    {
        guard let response = response as? HTTPURLResponse else {
            throw NetworkManagerError.error(errorMessage: "result.response is not of type HTTPURLResponse")
        }

        switch response.statusCode {
        case 200 ... 299:
            do {
                switch T.self {
                case is EmptyDTO.Type:
                    if data.isEmpty {
                        // swiftlint:disable:next force_cast - we just tested for T == EmptyDTO, and we need to return T
                        return EmptyDTO() as! T
                    }
                    fallthrough
                default:
                    return try JSONDecoder().decode(T.self, from: data, with: decodingStrategy, dateDecodingStrategy)
                }
            } catch {
                print(error)
                throw error
            }
        default:
            throw NetworkManagerError.serverError(statusCode: response.statusCode)
        }
    }
}
