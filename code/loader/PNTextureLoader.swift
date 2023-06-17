public protocol PNTextureLoader {
    func load(image: NSImage) -> MTLTexture?
    func load(name: String, 
              fileExtension: String, 
              bundle: Bundle) -> MTLTexture?
}