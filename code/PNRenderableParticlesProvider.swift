public protocol PNRenderableParticlesProvider {
    var provider: PNAnyDynamicBuffer<FrozenParticle> { get }
    var atlas: PNTextureAtlas { get }
    var positioningRules: PNPositioningRules { get }
}