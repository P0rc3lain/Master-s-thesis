public protocol PNTerrainLoader {
    func loadMesh(image: PNKitImage, material: PNMaterial) -> PNMesh?
    func load(name: String, extension: String, bundle: Bundle) -> MTLTexture?
}