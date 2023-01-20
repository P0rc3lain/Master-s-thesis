public protocol PNTextureLoader {
    func load(image: NSImage) -> MTLTexture?
    func load(name: String, extension: String, bundle: Bundle) -> MTLTexture?
}