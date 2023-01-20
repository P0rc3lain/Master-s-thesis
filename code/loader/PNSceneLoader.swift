public protocol PNSceneLoader {
    func resource(from url: URL) -> PNScene?
    func resource(name: String, extension: String, bundle: Bundle) -> PNScene?
}