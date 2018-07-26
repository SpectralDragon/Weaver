/// This file is generated by Weaver 0.9.13
/// DO NOT EDIT!
import Foundation
// MARK: - MovieManager
protocol MovieManagerInputDependencyResolver {
    var logger: Logger { get }
}
protocol MovieManagerDependencyResolver {
    var host: String? { get }
    var logger: Logger { get }
    var urlSession: URLSession { get }
    func urlSessionCustomRef() -> URLSession
    var movieAPI: APIProtocol { get }
}
final class MovieManagerDependencyContainer: MovieManagerDependencyResolver {
    let host: String?
    let logger: Logger
    private var _urlSession: URLSession?
    var urlSession: URLSession {
        if let value = _urlSession { return value }
        let value = urlSessionCustomRef()
        _urlSession = value
        return value
    }
    private var _movieAPI: APIProtocol?
    var movieAPI: APIProtocol {
        if let value = _movieAPI { return value }
        let dependencies = MovieAPIDependencyContainer(injecting: self)
        let value = MovieAPI(injecting: dependencies)
        _movieAPI = value
        return value
    }
    init(injecting dependencies: MovieManagerInputDependencyResolver, host: String?) {
        self.host = host
        logger = dependencies.logger
        _ = urlSession
        _ = movieAPI
    }
}
extension MovieManagerDependencyContainer: MovieAPIInputDependencyResolver {}
protocol MovieManagerDependencyInjectable {
    init(injecting dependencies: MovieManagerDependencyResolver)
}
final class MovieManagerShimDependencyContainer: MovieManagerInputDependencyResolver {
    let logger: Logger
    init(logger: Logger) {
        self.logger = logger
    }
}
extension MovieManager {
    public convenience init(logger: Logger, host: String?) {
        let shim = MovieManagerShimDependencyContainer(logger: logger)
        let dependencies = MovieManagerDependencyContainer(injecting: shim, host: host)
        self.init(injecting: dependencies)
    }
}