/// This file is generated by Weaver 0.12.0
/// DO NOT EDIT!
// MARK: - FooTest5
protocol FooTest5DependencyResolver {
    var fii: FiiTest5 { get }
}
final class FooTest5DependencyContainer: FooTest5DependencyResolver {
    private var _fii: FiiTest5?
    var fii: FiiTest5 {
        if let value = _fii { return value }
        let value = FiiTest5()
        _fii = value
        return value
    }
    init() {
        _ = fii
    }
}
// MARK: - FuuTest5
protocol FuuTest5DependencyResolver {
    var fii: FiiProtocolTest5 { get }
}
final class FuuTest5DependencyContainer: FuuTest5DependencyResolver {
    private var _fii: FiiProtocolTest5?
    var fii: FiiProtocolTest5 {
        if let value = _fii { return value }
        let value = FiiTest5()
        _fii = value
        return value
    }
    init() {
        _ = fii
    }
}
