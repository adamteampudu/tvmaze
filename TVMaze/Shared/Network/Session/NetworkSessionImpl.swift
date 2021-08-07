//
//  NetworkSessionImpl.swift
//
//  Created by Giomar Rodriguez on 14/06/21.
//

import Alamofire

final class NetworkSessionImpl: NetworkSession {

    private enum Constants {
        static let successStatusCodes: Range<Int> = 200..<300
    }

    private let alamofire: Session
    private let decoder: NetworkDataDecoder

    init(
        alamofire: Session,
        decoder: NetworkDataDecoder
    ) {
        self.alamofire = alamofire
        self.decoder = decoder
    }

    func request<P: Encodable, R: Decodable>(
        url: String,
        method: HTTPNetworkMethod,
        parameters: P,
        encoder: ParameterNetworkEncoder,
        onCompletion: @escaping (ApiResult<R>) -> Void,
        onSessionExpired: (() -> Void)?
    ) {
        alamofire.request(
            url,
            method: parseToHttpMethod(method),
            parameters: parameters,
            encoder: parseToEncoder(encoder)
        ).validate(statusCode: Constants.successStatusCodes)
        .responseJSON { [weak self] response in
            guard let self = self else { return }
            switch response.result {
            case .success:
                self.onSuccess(response.data, onCompletion)
            case .failure:
                self.onError(response, onCompletion, onSessionExpired)
            }
        }
    }

    func requestNoParams<R: Decodable>(
        url: String,
        method: HTTPNetworkMethod,
        onCompletion: @escaping (ApiResult<R>) -> Void,
        onSessionExpired: (() -> Void)?
    ) {
        alamofire.request(
            url,
            method: parseToHttpMethod(method),
            encoding: URLEncoding.default
        ).validate(statusCode: Constants.successStatusCodes)
        .responseJSON { [weak self] response in
            guard let self = self else { return }

            //TODO
            if let data = response.data {
                if let response = String(data: data, encoding: String.Encoding.utf8) {
                    debugPrint("request url", url)
                    debugPrint(response)
                }
            }

            
            switch response.result {
            case .success:
                self.onSuccess(response.data, onCompletion)
            case .failure:
                self.onError(response, onCompletion, onSessionExpired)
            }
        }
    }

    private func onSuccess<R: Decodable>(
        _ data: Data?,
        _ onCompletion: @escaping (ApiResult<R>) -> Void
    ) {
        if let dataAsJson = data {
            do {
                let dataAsObject: R = try decoder.decodeJson(dataAsJson: dataAsJson)
                onCompletion(ApiResult.success(data: dataAsObject))
            } catch {
                onCompletion(ApiResult.error(error: .general(error)))
            }
        } else {
            onCompletion(ApiResult.error(error: .general()))
        }
    }

    private func onError<R>(
        _ response: AFDataResponse<Any>,
        _ onCompletion: @escaping (ApiResult<R>) -> Void,
        _ onSessionExpired: (() -> Void)?
    ) {
        debugPrint(response.error ?? "An error occurred making a request")
        if let _ = response.error {
            decodeErrorBody(response.data, onCompletion)
        } else {
            onCompletion(ApiResult.error(error: .general()))
        }
    }

    private func decodeErrorBody<R>(
        _ data: Data?,
        _ onCompletion: @escaping (ApiResult<R>) -> Void
    ) {
        if let dataAsJson = data {
            do {
                let apiError: ApiError = try decoder.decodeJson(dataAsJson: dataAsJson)
                onCompletion(ApiResult.error(error: .api(apiError)))
            } catch {
                onCompletion(ApiResult.error(error: .general(error)))
            }
        } else {
            onCompletion(ApiResult.error(error: .general()))
        }
    }

    private func parseToHttpMethod(_ httpNetworkMethod: HTTPNetworkMethod) -> HTTPMethod {
        switch httpNetworkMethod {
        case .get:
            return .get
        case .post:
            return .post
        case .put:
            return .put
        case .delete:
            return .delete
        }
    }

    private func parseToEncoder(_ parameterEncoder: ParameterNetworkEncoder) -> ParameterEncoder {
        switch parameterEncoder {
        case .urlParameter:
            return URLEncodedFormParameterEncoder.default
        case .json:
            return JSONParameterEncoder.default
        }
    }

}
