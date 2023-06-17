public struct PNDefaults {
    public static var shared = PNDefaults()
    public var rendering = PNRendering()
    [...]
    public struct PNRendering {
        public var shadowSize = PNShadowSize()
    }
    public struct PNShadowSize {
        public var omni = simd_uint2(512, 512)
        public var directional = simd_uint2(512, 512)
        public var spot = simd_uint2(512, 512)
    }
    [...]
}