public final class PNSceneDescription {
    public var entities = PNEntityTree()
    public var uniforms = [PNWModelUniforms]()
    public var boundingBoxes = [PNWBoundingBox?]()
    public var models = [PNModelReference]()
    public var animatedModels = [PNAnimatedModelReference]()
    public var paletteOffset = [PNIndex]()
    public var meshes = [PNMesh]()
    public var skeletons = [PNSkeleton]()
    public var palettes = [PNBLTransform]()
    public var cameras = [PNCamera]()
    public var cameraUniforms = [CameraUniforms]()
    public var omniLights = [OmniLight]()
    public var ambientLights = [AmbientLight]()
    public var directionalLights = [DirectionalLight]()
    public var spotLights = [SpotLight]()
    public var particles = [PNParticleSystem]()
    public var skyMap: MTLTexture?
    public var activeCameraIdx = PNIndex.nil
}