public protocol PNSceneLoader {
    func resource(from url: URL) -> PNScene?
    func resource(name: String, 
                  fileExtension: String, 
                  bundle: Bundle) -> PNScene?
}