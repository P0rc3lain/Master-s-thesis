public protocol PNCameraNode: PNSceneNode {
    var camera: PNCamera { get }
    var priority: PNPriority { get }
}