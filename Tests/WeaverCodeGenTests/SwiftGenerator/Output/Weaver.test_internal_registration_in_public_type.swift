/// This file is generated by Weaver 0.12.0
/// DO NOT EDIT!
// MARK: - FooTest9
protocol FooTest9DependencyResolver {
    var fuu: String { get }
}
final class FooTest9DependencyContainer: FooTest9DependencyResolver {
    let fuu: String
    init(fuu: String) {
        self.fuu = fuu
    }
}
// MARK: - FuuTest9
protocol FuuTest9DependencyResolver {
    var fuu: String { get }
    func foo(fuu: String) -> FooTest9
}
final class FuuTest9DependencyContainer: FuuTest9DependencyResolver {
    let fuu: String
    private var _foo: FooTest9?
    func foo(fuu: String) -> FooTest9 {
        if let value = _foo { return value }
        let dependencies = FooTest9DependencyContainer(fuu: fuu)
        let value = FooTest9(injecting: dependencies)
        _foo = value
        return value
    }
    init(fuu: String) {
        self.fuu = fuu
        _ = foo(fuu: fuu)
    }
}
extension FuuTest9 {
    public convenience init(fuu: String) {
        let dependencies = FuuTest9DependencyContainer(fuu: fuu)
        self.init(injecting: dependencies)
    }
}
