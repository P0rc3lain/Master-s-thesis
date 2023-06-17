public protocol PNTerrainLoader {
    func loadMesh(image: PNKitImage, material: PNMaterial) -> PNMesh?
    func load(name: String, 
              fileExtension: String, 
              bundle: Bundle) -> MTLTexture?
}