// MARK: - Mocks generated from file: TVMaze/Shared/Data/LocalStorage/LocalStorage.swift at 2021-08-09 01:31:10 +0000

//
//  KeyChainProtocol.swift
//
//  Created by Giomar Rodriguez on 10/21/20.
//

import Cuckoo
@testable import TVMaze

import Foundation


 class MockLocalStorage: LocalStorage, Cuckoo.ProtocolMock {
    
     typealias MocksType = LocalStorage
    
     typealias Stubbing = __StubbingProxy_LocalStorage
     typealias Verification = __VerificationProxy_LocalStorage

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: LocalStorage?

     func enableDefaultImplementation(_ stub: LocalStorage) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     func save<T>(_ value: T?, key: String, useAuthentication: Bool) -> Bool {
        
    return cuckoo_manager.call("save(_: T?, key: String, useAuthentication: Bool) -> Bool",
            parameters: (value, key, useAuthentication),
            escapingParameters: (value, key, useAuthentication),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.save(value, key: key, useAuthentication: useAuthentication))
        
    }
    
    
    
     func load<T>(key: String) -> T? {
        
    return cuckoo_manager.call("load(key: String) -> T?",
            parameters: (key),
            escapingParameters: (key),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.load(key: key))
        
    }
    
    
    
     func delete(key: String) -> Bool {
        
    return cuckoo_manager.call("delete(key: String) -> Bool",
            parameters: (key),
            escapingParameters: (key),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.delete(key: key))
        
    }
    
    
    
     func contains(key: String) -> Bool {
        
    return cuckoo_manager.call("contains(key: String) -> Bool",
            parameters: (key),
            escapingParameters: (key),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.contains(key: key))
        
    }
    

	 struct __StubbingProxy_LocalStorage: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func save<M1: Cuckoo.OptionalMatchable, M2: Cuckoo.Matchable, M3: Cuckoo.Matchable, T>(_ value: M1, key: M2, useAuthentication: M3) -> Cuckoo.ProtocolStubFunction<(T?, String, Bool), Bool> where M1.OptionalMatchedType == T, M2.MatchedType == String, M3.MatchedType == Bool {
	        let matchers: [Cuckoo.ParameterMatcher<(T?, String, Bool)>] = [wrap(matchable: value) { $0.0 }, wrap(matchable: key) { $0.1 }, wrap(matchable: useAuthentication) { $0.2 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockLocalStorage.self, method: "save(_: T?, key: String, useAuthentication: Bool) -> Bool", parameterMatchers: matchers))
	    }
	    
	    func load<M1: Cuckoo.Matchable, T>(key: M1) -> Cuckoo.ProtocolStubFunction<(String), T?> where M1.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: key) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockLocalStorage.self, method: "load(key: String) -> T?", parameterMatchers: matchers))
	    }
	    
	    func delete<M1: Cuckoo.Matchable>(key: M1) -> Cuckoo.ProtocolStubFunction<(String), Bool> where M1.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: key) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockLocalStorage.self, method: "delete(key: String) -> Bool", parameterMatchers: matchers))
	    }
	    
	    func contains<M1: Cuckoo.Matchable>(key: M1) -> Cuckoo.ProtocolStubFunction<(String), Bool> where M1.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: key) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockLocalStorage.self, method: "contains(key: String) -> Bool", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_LocalStorage: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func save<M1: Cuckoo.OptionalMatchable, M2: Cuckoo.Matchable, M3: Cuckoo.Matchable, T>(_ value: M1, key: M2, useAuthentication: M3) -> Cuckoo.__DoNotUse<(T?, String, Bool), Bool> where M1.OptionalMatchedType == T, M2.MatchedType == String, M3.MatchedType == Bool {
	        let matchers: [Cuckoo.ParameterMatcher<(T?, String, Bool)>] = [wrap(matchable: value) { $0.0 }, wrap(matchable: key) { $0.1 }, wrap(matchable: useAuthentication) { $0.2 }]
	        return cuckoo_manager.verify("save(_: T?, key: String, useAuthentication: Bool) -> Bool", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func load<M1: Cuckoo.Matchable, T>(key: M1) -> Cuckoo.__DoNotUse<(String), T?> where M1.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: key) { $0 }]
	        return cuckoo_manager.verify("load(key: String) -> T?", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func delete<M1: Cuckoo.Matchable>(key: M1) -> Cuckoo.__DoNotUse<(String), Bool> where M1.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: key) { $0 }]
	        return cuckoo_manager.verify("delete(key: String) -> Bool", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func contains<M1: Cuckoo.Matchable>(key: M1) -> Cuckoo.__DoNotUse<(String), Bool> where M1.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: key) { $0 }]
	        return cuckoo_manager.verify("contains(key: String) -> Bool", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class LocalStorageStub: LocalStorage {
    

    

    
     func save<T>(_ value: T?, key: String, useAuthentication: Bool) -> Bool  {
        return DefaultValueRegistry.defaultValue(for: (Bool).self)
    }
    
     func load<T>(key: String) -> T?  {
        return DefaultValueRegistry.defaultValue(for: (T?).self)
    }
    
     func delete(key: String) -> Bool  {
        return DefaultValueRegistry.defaultValue(for: (Bool).self)
    }
    
     func contains(key: String) -> Bool  {
        return DefaultValueRegistry.defaultValue(for: (Bool).self)
    }
    
}


// MARK: - Mocks generated from file: TVMaze/Shared/Network/Manager/NetworkManager.swift at 2021-08-09 01:31:10 +0000

//
//  NetworkManager.swift
//  TVMaze
//
//  Created by Daniel Santamaria on 10/20/20.
//

import Cuckoo
@testable import TVMaze

import Foundation


 class MockNetworkManager: NetworkManager, Cuckoo.ProtocolMock {
    
     typealias MocksType = NetworkManager
    
     typealias Stubbing = __StubbingProxy_NetworkManager
     typealias Verification = __VerificationProxy_NetworkManager

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: NetworkManager?

     func enableDefaultImplementation(_ stub: NetworkManager) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     func request<P: Encodable, R: Decodable>(endpoint: String, method: HTTPNetworkMethod, parameters: P, onCompletion: @escaping (ApiResult<R>) -> Void)  {
        
    return cuckoo_manager.call("request(endpoint: String, method: HTTPNetworkMethod, parameters: P, onCompletion: @escaping (ApiResult<R>) -> Void)",
            parameters: (endpoint, method, parameters, onCompletion),
            escapingParameters: (endpoint, method, parameters, onCompletion),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.request(endpoint: endpoint, method: method, parameters: parameters, onCompletion: onCompletion))
        
    }
    
    
    
     func requestNoParams<R: Decodable>(endpoint: String, method: HTTPNetworkMethod, onCompletion: @escaping (ApiResult<R>) -> Void)  {
        
    return cuckoo_manager.call("requestNoParams(endpoint: String, method: HTTPNetworkMethod, onCompletion: @escaping (ApiResult<R>) -> Void)",
            parameters: (endpoint, method, onCompletion),
            escapingParameters: (endpoint, method, onCompletion),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.requestNoParams(endpoint: endpoint, method: method, onCompletion: onCompletion))
        
    }
    

	 struct __StubbingProxy_NetworkManager: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func request<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.Matchable, M4: Cuckoo.Matchable, P: Encodable, R: Decodable>(endpoint: M1, method: M2, parameters: M3, onCompletion: M4) -> Cuckoo.ProtocolStubNoReturnFunction<(String, HTTPNetworkMethod, P, (ApiResult<R>) -> Void)> where M1.MatchedType == String, M2.MatchedType == HTTPNetworkMethod, M3.MatchedType == P, M4.MatchedType == (ApiResult<R>) -> Void {
	        let matchers: [Cuckoo.ParameterMatcher<(String, HTTPNetworkMethod, P, (ApiResult<R>) -> Void)>] = [wrap(matchable: endpoint) { $0.0 }, wrap(matchable: method) { $0.1 }, wrap(matchable: parameters) { $0.2 }, wrap(matchable: onCompletion) { $0.3 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockNetworkManager.self, method: "request(endpoint: String, method: HTTPNetworkMethod, parameters: P, onCompletion: @escaping (ApiResult<R>) -> Void)", parameterMatchers: matchers))
	    }
	    
	    func requestNoParams<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.Matchable, R: Decodable>(endpoint: M1, method: M2, onCompletion: M3) -> Cuckoo.ProtocolStubNoReturnFunction<(String, HTTPNetworkMethod, (ApiResult<R>) -> Void)> where M1.MatchedType == String, M2.MatchedType == HTTPNetworkMethod, M3.MatchedType == (ApiResult<R>) -> Void {
	        let matchers: [Cuckoo.ParameterMatcher<(String, HTTPNetworkMethod, (ApiResult<R>) -> Void)>] = [wrap(matchable: endpoint) { $0.0 }, wrap(matchable: method) { $0.1 }, wrap(matchable: onCompletion) { $0.2 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockNetworkManager.self, method: "requestNoParams(endpoint: String, method: HTTPNetworkMethod, onCompletion: @escaping (ApiResult<R>) -> Void)", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_NetworkManager: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func request<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.Matchable, M4: Cuckoo.Matchable, P: Encodable, R: Decodable>(endpoint: M1, method: M2, parameters: M3, onCompletion: M4) -> Cuckoo.__DoNotUse<(String, HTTPNetworkMethod, P, (ApiResult<R>) -> Void), Void> where M1.MatchedType == String, M2.MatchedType == HTTPNetworkMethod, M3.MatchedType == P, M4.MatchedType == (ApiResult<R>) -> Void {
	        let matchers: [Cuckoo.ParameterMatcher<(String, HTTPNetworkMethod, P, (ApiResult<R>) -> Void)>] = [wrap(matchable: endpoint) { $0.0 }, wrap(matchable: method) { $0.1 }, wrap(matchable: parameters) { $0.2 }, wrap(matchable: onCompletion) { $0.3 }]
	        return cuckoo_manager.verify("request(endpoint: String, method: HTTPNetworkMethod, parameters: P, onCompletion: @escaping (ApiResult<R>) -> Void)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func requestNoParams<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.Matchable, R: Decodable>(endpoint: M1, method: M2, onCompletion: M3) -> Cuckoo.__DoNotUse<(String, HTTPNetworkMethod, (ApiResult<R>) -> Void), Void> where M1.MatchedType == String, M2.MatchedType == HTTPNetworkMethod, M3.MatchedType == (ApiResult<R>) -> Void {
	        let matchers: [Cuckoo.ParameterMatcher<(String, HTTPNetworkMethod, (ApiResult<R>) -> Void)>] = [wrap(matchable: endpoint) { $0.0 }, wrap(matchable: method) { $0.1 }, wrap(matchable: onCompletion) { $0.2 }]
	        return cuckoo_manager.verify("requestNoParams(endpoint: String, method: HTTPNetworkMethod, onCompletion: @escaping (ApiResult<R>) -> Void)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class NetworkManagerStub: NetworkManager {
    

    

    
     func request<P: Encodable, R: Decodable>(endpoint: String, method: HTTPNetworkMethod, parameters: P, onCompletion: @escaping (ApiResult<R>) -> Void)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     func requestNoParams<R: Decodable>(endpoint: String, method: HTTPNetworkMethod, onCompletion: @escaping (ApiResult<R>) -> Void)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}


// MARK: - Mocks generated from file: TVMaze/Shared/Network/Session/NetworkSession.swift at 2021-08-09 01:31:10 +0000

//
//  NetworkSession.swift
//
//  Created by Giomar Rodriguez on 14/06/21.
//

import Cuckoo
@testable import TVMaze

import Foundation


 class MockNetworkSession: NetworkSession, Cuckoo.ProtocolMock {
    
     typealias MocksType = NetworkSession
    
     typealias Stubbing = __StubbingProxy_NetworkSession
     typealias Verification = __VerificationProxy_NetworkSession

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: NetworkSession?

     func enableDefaultImplementation(_ stub: NetworkSession) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     func request<P: Encodable, R: Decodable>(url: String, method: HTTPNetworkMethod, parameters: P, encoder: ParameterNetworkEncoder, onCompletion: @escaping (ApiResult<R>) -> Void, onSessionExpired: (() -> Void)?)  {
        
    return cuckoo_manager.call("request(url: String, method: HTTPNetworkMethod, parameters: P, encoder: ParameterNetworkEncoder, onCompletion: @escaping (ApiResult<R>) -> Void, onSessionExpired: (() -> Void)?)",
            parameters: (url, method, parameters, encoder, onCompletion, onSessionExpired),
            escapingParameters: (url, method, parameters, encoder, onCompletion, onSessionExpired),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.request(url: url, method: method, parameters: parameters, encoder: encoder, onCompletion: onCompletion, onSessionExpired: onSessionExpired))
        
    }
    
    
    
     func requestNoParams<R: Decodable>(url: String, method: HTTPNetworkMethod, onCompletion: @escaping (ApiResult<R>) -> Void, onSessionExpired: (() -> Void)?)  {
        
    return cuckoo_manager.call("requestNoParams(url: String, method: HTTPNetworkMethod, onCompletion: @escaping (ApiResult<R>) -> Void, onSessionExpired: (() -> Void)?)",
            parameters: (url, method, onCompletion, onSessionExpired),
            escapingParameters: (url, method, onCompletion, onSessionExpired),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.requestNoParams(url: url, method: method, onCompletion: onCompletion, onSessionExpired: onSessionExpired))
        
    }
    

	 struct __StubbingProxy_NetworkSession: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func request<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.Matchable, M4: Cuckoo.Matchable, M5: Cuckoo.Matchable, M6: Cuckoo.OptionalMatchable, P: Encodable, R: Decodable>(url: M1, method: M2, parameters: M3, encoder: M4, onCompletion: M5, onSessionExpired: M6) -> Cuckoo.ProtocolStubNoReturnFunction<(String, HTTPNetworkMethod, P, ParameterNetworkEncoder, (ApiResult<R>) -> Void, (() -> Void)?)> where M1.MatchedType == String, M2.MatchedType == HTTPNetworkMethod, M3.MatchedType == P, M4.MatchedType == ParameterNetworkEncoder, M5.MatchedType == (ApiResult<R>) -> Void, M6.OptionalMatchedType == (() -> Void) {
	        let matchers: [Cuckoo.ParameterMatcher<(String, HTTPNetworkMethod, P, ParameterNetworkEncoder, (ApiResult<R>) -> Void, (() -> Void)?)>] = [wrap(matchable: url) { $0.0 }, wrap(matchable: method) { $0.1 }, wrap(matchable: parameters) { $0.2 }, wrap(matchable: encoder) { $0.3 }, wrap(matchable: onCompletion) { $0.4 }, wrap(matchable: onSessionExpired) { $0.5 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockNetworkSession.self, method: "request(url: String, method: HTTPNetworkMethod, parameters: P, encoder: ParameterNetworkEncoder, onCompletion: @escaping (ApiResult<R>) -> Void, onSessionExpired: (() -> Void)?)", parameterMatchers: matchers))
	    }
	    
	    func requestNoParams<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.Matchable, M4: Cuckoo.OptionalMatchable, R: Decodable>(url: M1, method: M2, onCompletion: M3, onSessionExpired: M4) -> Cuckoo.ProtocolStubNoReturnFunction<(String, HTTPNetworkMethod, (ApiResult<R>) -> Void, (() -> Void)?)> where M1.MatchedType == String, M2.MatchedType == HTTPNetworkMethod, M3.MatchedType == (ApiResult<R>) -> Void, M4.OptionalMatchedType == (() -> Void) {
	        let matchers: [Cuckoo.ParameterMatcher<(String, HTTPNetworkMethod, (ApiResult<R>) -> Void, (() -> Void)?)>] = [wrap(matchable: url) { $0.0 }, wrap(matchable: method) { $0.1 }, wrap(matchable: onCompletion) { $0.2 }, wrap(matchable: onSessionExpired) { $0.3 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockNetworkSession.self, method: "requestNoParams(url: String, method: HTTPNetworkMethod, onCompletion: @escaping (ApiResult<R>) -> Void, onSessionExpired: (() -> Void)?)", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_NetworkSession: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func request<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.Matchable, M4: Cuckoo.Matchable, M5: Cuckoo.Matchable, M6: Cuckoo.OptionalMatchable, P: Encodable, R: Decodable>(url: M1, method: M2, parameters: M3, encoder: M4, onCompletion: M5, onSessionExpired: M6) -> Cuckoo.__DoNotUse<(String, HTTPNetworkMethod, P, ParameterNetworkEncoder, (ApiResult<R>) -> Void, (() -> Void)?), Void> where M1.MatchedType == String, M2.MatchedType == HTTPNetworkMethod, M3.MatchedType == P, M4.MatchedType == ParameterNetworkEncoder, M5.MatchedType == (ApiResult<R>) -> Void, M6.OptionalMatchedType == (() -> Void) {
	        let matchers: [Cuckoo.ParameterMatcher<(String, HTTPNetworkMethod, P, ParameterNetworkEncoder, (ApiResult<R>) -> Void, (() -> Void)?)>] = [wrap(matchable: url) { $0.0 }, wrap(matchable: method) { $0.1 }, wrap(matchable: parameters) { $0.2 }, wrap(matchable: encoder) { $0.3 }, wrap(matchable: onCompletion) { $0.4 }, wrap(matchable: onSessionExpired) { $0.5 }]
	        return cuckoo_manager.verify("request(url: String, method: HTTPNetworkMethod, parameters: P, encoder: ParameterNetworkEncoder, onCompletion: @escaping (ApiResult<R>) -> Void, onSessionExpired: (() -> Void)?)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func requestNoParams<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.Matchable, M4: Cuckoo.OptionalMatchable, R: Decodable>(url: M1, method: M2, onCompletion: M3, onSessionExpired: M4) -> Cuckoo.__DoNotUse<(String, HTTPNetworkMethod, (ApiResult<R>) -> Void, (() -> Void)?), Void> where M1.MatchedType == String, M2.MatchedType == HTTPNetworkMethod, M3.MatchedType == (ApiResult<R>) -> Void, M4.OptionalMatchedType == (() -> Void) {
	        let matchers: [Cuckoo.ParameterMatcher<(String, HTTPNetworkMethod, (ApiResult<R>) -> Void, (() -> Void)?)>] = [wrap(matchable: url) { $0.0 }, wrap(matchable: method) { $0.1 }, wrap(matchable: onCompletion) { $0.2 }, wrap(matchable: onSessionExpired) { $0.3 }]
	        return cuckoo_manager.verify("requestNoParams(url: String, method: HTTPNetworkMethod, onCompletion: @escaping (ApiResult<R>) -> Void, onSessionExpired: (() -> Void)?)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class NetworkSessionStub: NetworkSession {
    

    

    
     func request<P: Encodable, R: Decodable>(url: String, method: HTTPNetworkMethod, parameters: P, encoder: ParameterNetworkEncoder, onCompletion: @escaping (ApiResult<R>) -> Void, onSessionExpired: (() -> Void)?)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     func requestNoParams<R: Decodable>(url: String, method: HTTPNetworkMethod, onCompletion: @escaping (ApiResult<R>) -> Void, onSessionExpired: (() -> Void)?)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}


// MARK: - Mocks generated from file: TVMaze/Shows/Data/DataSource/ShowsLocalDataSource.swift at 2021-08-09 01:31:10 +0000

//
//  ShowsLocalDataSource.swift
//  TVMaze
//
//  Created by Adam Teale on 07-08-21.
//

import Cuckoo
@testable import TVMaze

import Foundation


 class MockShowsLocalDataSource: ShowsLocalDataSource, Cuckoo.ProtocolMock {
    
     typealias MocksType = ShowsLocalDataSource
    
     typealias Stubbing = __StubbingProxy_ShowsLocalDataSource
     typealias Verification = __VerificationProxy_ShowsLocalDataSource

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: ShowsLocalDataSource?

     func enableDefaultImplementation(_ stub: ShowsLocalDataSource) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     func update(showId: Int, asFavorite: Bool) -> Bool {
        
    return cuckoo_manager.call("update(showId: Int, asFavorite: Bool) -> Bool",
            parameters: (showId, asFavorite),
            escapingParameters: (showId, asFavorite),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.update(showId: showId, asFavorite: asFavorite))
        
    }
    
    
    
     func getFavorites() -> [Int] {
        
    return cuckoo_manager.call("getFavorites() -> [Int]",
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.getFavorites())
        
    }
    

	 struct __StubbingProxy_ShowsLocalDataSource: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func update<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(showId: M1, asFavorite: M2) -> Cuckoo.ProtocolStubFunction<(Int, Bool), Bool> where M1.MatchedType == Int, M2.MatchedType == Bool {
	        let matchers: [Cuckoo.ParameterMatcher<(Int, Bool)>] = [wrap(matchable: showId) { $0.0 }, wrap(matchable: asFavorite) { $0.1 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockShowsLocalDataSource.self, method: "update(showId: Int, asFavorite: Bool) -> Bool", parameterMatchers: matchers))
	    }
	    
	    func getFavorites() -> Cuckoo.ProtocolStubFunction<(), [Int]> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockShowsLocalDataSource.self, method: "getFavorites() -> [Int]", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_ShowsLocalDataSource: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func update<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(showId: M1, asFavorite: M2) -> Cuckoo.__DoNotUse<(Int, Bool), Bool> where M1.MatchedType == Int, M2.MatchedType == Bool {
	        let matchers: [Cuckoo.ParameterMatcher<(Int, Bool)>] = [wrap(matchable: showId) { $0.0 }, wrap(matchable: asFavorite) { $0.1 }]
	        return cuckoo_manager.verify("update(showId: Int, asFavorite: Bool) -> Bool", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func getFavorites() -> Cuckoo.__DoNotUse<(), [Int]> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("getFavorites() -> [Int]", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class ShowsLocalDataSourceStub: ShowsLocalDataSource {
    

    

    
     func update(showId: Int, asFavorite: Bool) -> Bool  {
        return DefaultValueRegistry.defaultValue(for: (Bool).self)
    }
    
     func getFavorites() -> [Int]  {
        return DefaultValueRegistry.defaultValue(for: ([Int]).self)
    }
    
}

