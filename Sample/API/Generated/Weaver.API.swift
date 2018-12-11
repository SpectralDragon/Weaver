/// This file is generated by Weaver 0.11.1
/// DO NOT EDIT!
import Foundation
// MARK: - MovieAPI
protocol MovieAPIInputDependencyResolver {
    var urlSession: URLSession { get }
}
protocol MovieAPIDependencyResolver {
    var urlSession: URLSession { get }
    var logger: Logger { get }
}
final class MovieAPIDependencyContainer: MovieAPIDependencyResolver {
    let urlSession: URLSession
    private var _logger: Logger?
    var logger: Logger {
        if let value = _logger { return value }
        let value = Logger()
        _logger = value
        return value
    }
    init(injecting dependencies: MovieAPIInputDependencyResolver) {
        urlSession = dependencies.urlSession
        _ = logger
    }
}
final class MovieAPIShimDependencyContainer: MovieAPIInputDependencyResolver {
    let urlSession: URLSession
    init(urlSession: URLSession) {
        self.urlSession = urlSession
    }
}
extension MovieAPI {
    public convenience init(urlSession: URLSession) {
        let shim = MovieAPIShimDependencyContainer(urlSession: urlSession)
        let dependencies = MovieAPIDependencyContainer(injecting: shim)
        self.init(injecting: dependencies)
    }
}