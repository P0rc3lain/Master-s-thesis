public protocol PNDirectionalLight {
    var color: PNColorRGB { get }
    var intensity: Float { get }
    var direction: PNDirection3DN { get }
    var castsShadows: Bool { get }
}